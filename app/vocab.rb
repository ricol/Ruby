#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'net/http'
require 'uri'
require 'fileutils'
require 'csv'
require 'thread'
require 'time'

# Constants
DEFAULT_LINE_LENGTH = 80
DEFAULT_DATA_FILE = File.join(Dir.home, '.words.dat')
RANDOM_WORD_CACHE_FILE = File.join(Dir.home, '.word_cache.json')
RANDOM_WORD_CACHE_EXPIRY = 86400 # 24 hours in seconds

# Color codes for terminal output
module Colors
  HEADER = "\033[95m"
  BLUE = "\033[94m"
  CYAN = "\033[96m"
  GREEN = "\033[92m"
  WARNING = "\033[93m"
  FAIL = "\033[91m"
  END = "\033[0m"
  BOLD = "\033[1m"
  UNDERLINE = "\033[4m"
end

# String extensions for CJK character handling
class String
  def is_cjk?
    each_char.any? { |c| c.match?(/[\u4e00-\u9fff\u3040-\u309f\u30a0-\u30ff\uac00-\ud7af]/) }
  end

  def display_width
    chars.sum { |c| c.is_cjk? ? 2 : 1 }
  end
end

# Random word fetcher with caching
class RandomWordFetcher
  API_ENDPOINTS = [
    {
      name: 'WordDrip',
      url: 'https://worddrip.onrender.com/',
      response_type: 'json',
      word_field: 'word',
      definition_field: 'definition',
      enabled: true
    },
    {
      name: 'Random-Words-API',
      url: 'https://random-words-api-9itish.vercel.app/',
      response_type: 'json',
      word_field: 'word',
      definition_field: 'definition',
      enabled: true
    }
  ].freeze

  # Built-in word list as fallback
  FALLBACK_WORDS = [
    "serendipity", "ephemeral", "quintessential", "mellifluous",
    "petrichor", "sonorous", "effervescent", "luminescence",
    "ethereal", "opulent", "resplendent", "cherish",
    "solitude", "serenity", "tranquility", "harmony",
    "curiosity", "adventure", "discovery", "imagination",
    "resilience", "perseverance", "dedication", "ambition"
  ].freeze

  def initialize
    @cache = load_cache
  end

  def load_cache
    if File.exist?(RANDOM_WORD_CACHE_FILE)
      begin
        cache = JSON.parse(File.read(RANDOM_WORD_CACHE_FILE))
        if Time.now.to_i - cache['timestamp'] < RANDOM_WORD_CACHE_EXPIRY
          return cache
        end
      rescue JSON::ParserError, IOError
        # Ignore cache errors
      end
    end
    { 'timestamp' => Time.now.to_i, 'words' => [] }
  end

  def save_cache
    @cache['timestamp'] = Time.now.to_i
    File.write(RANDOM_WORD_CACHE_FILE, JSON.pretty_generate(@cache))
  rescue IOError
    # Silently fail if can't write cache
  end

  def fetch_from_api(api_config)
    return nil unless api_config[:enabled]

    begin
      uri = URI(api_config[:url])
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'
      http.open_timeout = 5
      http.read_timeout = 5

      request = Net::HTTP::Get.new(uri)
      request['User-Agent'] = 'Vocabulary-Learning-Tool/1.0'

      response = http.request(request)
      return nil unless response.is_a?(Net::HTTPSuccess)

      data = JSON.parse(response.body)

      if api_config[:response_type] == 'json'
        word = data[api_config[:word_field]]
        definition = data[api_config[:definition_field]] if api_config[:definition_field]

        if word
          return {
            word: word,
            definition: definition,
            source: api_config[:name]
          }
        end
      end
    rescue StandardError
      # Silently fail and try next API
      nil
    end
  end

  def fetch_random_word(force_refresh: false)
    # Check cache first if not forcing refresh
    if !force_refresh && @cache['words'].any?
      cached_word = @cache['words'].sample
      return {
        word: cached_word['word'],
        definition: cached_word['definition'],
        source: 'cache'
      }
    end

    # Try each API in random order
    API_ENDPOINTS.shuffle.each do |api|
      result = fetch_from_api(api)
      next unless result

      # Add to cache
      @cache['words'] << {
        'word' => result[:word],
        'definition' => result[:definition]
      }
      # Keep cache size reasonable (last 100 words)
      @cache['words'] = @cache['words'].last(100)
      save_cache
      return result
    end

    # Fallback to built-in word list
    word = FALLBACK_WORDS.sample
    {
      word: word,
      definition: nil,
      source: 'fallback'
    }
  end

  def fetch_multiple_words(count = 5)
    words = []
    count.times do
      words << fetch_random_word
      sleep 0.5 # Small delay to avoid rate limiting
    end
    words
  end
end

# Word entry class
class WordEntry
  attr_accessor :word, :meaning, :tags, :examples

  def initialize(word:, meaning:, tags: [], examples: [])
    @word = word
    @meaning = meaning
    @tags = tags || []
    @examples = examples || []
  end

  def to_hash
    {
      word: @word,
      meaning: @meaning,
      tags: @tags,
      examples: @examples
    }
  end

  def self.from_hash(data)
    new(
      word: data['word'],
      meaning: data['meaning'],
      tags: data['tags'],
      examples: data['examples']
    )
  end
end

# Custom error class
class VocabularyError < StandardError; end

# Word formatter for display
class WordFormatter
  def initialize(line_length = DEFAULT_LINE_LENGTH)
    @line_length = line_length
  end

  def center_text(text, border_char = "=", border_type = 1)
    display_width = text.display_width
    total_padding = @line_length - display_width - 2
    left_padding = total_padding / 2
    right_padding = total_padding - left_padding

    inner_char = border_type == 1 ? border_char : " "

    result = border_char
    result += inner_char * left_padding
    result += text
    result += inner_char * right_padding
    result += border_char
  end

  def format_word_display(word, meaning)
    [
      center_text("WORD", "="),
      center_text(word, "=", 2),
      center_text(meaning, "=", 2),
      center_text("", "=")
    ].join("\n")
  end
end

# Vocabulary database
class VocabularyDatabase
  attr_reader :words

  def initialize(data_file = DEFAULT_DATA_FILE)
    @data_file = data_file
    @words = {}
  end

  def save(filename = nil)
    save_file = filename || @data_file

    data = @words.transform_values(&:to_hash)

    File.write(save_file, JSON.pretty_generate(data))
    puts "#{Colors::GREEN}✓ Dictionary saved to #{save_file}#{Colors::END}"
    puts "Total words: #{@words.size}"
  rescue IOError => e
    raise VocabularyError, "Failed to save dictionary: #{e}"
  end

  def load(filename = nil)
    load_file = filename || @data_file

    unless File.exist?(load_file)
      puts "#{Colors::WARNING}! #{load_file} doesn't exist.#{Colors::END}"
      return
    end

    begin
      data = JSON.parse(File.read(load_file))
      @words.clear

      data.each do |word, entry_data|
        @words[word] = WordEntry.from_hash(entry_data)
      end

      puts "#{Colors::GREEN}✓ Dictionary loaded from #{load_file}#{Colors::END}"
      puts "Total words: #{@words.size}"
    rescue JSON::ParserError
      raise VocabularyError, "Invalid JSON format in #{load_file}"
    rescue IOError => e
      raise VocabularyError, "Failed to load dictionary: #{e}"
    end
  end

  def export_csv(filename)
    CSV.open(filename, 'w') do |csv|
      csv << ['Word', 'Meaning', 'Tags', 'Examples']

      @words.each_value do |entry|
        csv << [
          entry.word,
          entry.meaning,
          entry.tags.join('|'),
          entry.examples.join('|')
        ]
      end
    end

    puts "#{Colors::GREEN}✓ Exported to #{filename}#{Colors::END}"
  rescue IOError => e
    raise VocabularyError, "Failed to export: #{e}"
  end
end

# Main application class
class VocabularyApp
  def initialize(data_file = nil)
    @db = VocabularyDatabase.new(data_file || DEFAULT_DATA_FILE)
    @formatter = WordFormatter.new
    @running = true
    @word_fetcher = RandomWordFetcher.new

    # Load default data file if it exists
    load_default if File.exist?(DEFAULT_DATA_FILE)

    # Set up signal handler
    trap('INT') { signal_handler }
  end

  def load_default
    @db.load
  rescue VocabularyError => e
    puts "#{Colors::WARNING}Warning: #{e}#{Colors::END}"
  end

  def signal_handler
    puts "\n#{Colors::WARNING}Interrupted. Exiting...#{Colors::END}"
    @running = false
    exit(0)
  end

  def add_word(word, meaning, tags = nil, examples = nil)
    raise VocabularyError, "Word and meaning are required" if word.nil? || word.empty? || meaning.nil? || meaning.empty?

    # Check for duplicates
    if @db.words.key?(word)
      puts "#{Colors::WARNING}Warning: '#{word}' already exists.#{Colors::END}"
      print "Overwrite? (y/n): "
      response = gets.chomp.downcase
      if response != 'y'
        puts "Addition cancelled."
        return
      end
    end

    entry = WordEntry.new(
      word: word,
      meaning: meaning,
      tags: tags,
      examples: examples
    )
    @db.words[word] = entry
    puts "#{Colors::GREEN}✓ Added: #{word} -> #{meaning}#{Colors::END}"
  end

  def add_random_word(meaning = nil)
    puts "#{Colors::CYAN}Fetching random word...#{Colors::END}"

    begin
      word_info = @word_fetcher.fetch_random_word
      word = word_info[:word]

      word_meaning = if meaning
                      meaning
                    else
                      word_info[:definition] || begin
                        print "\nWord: #{Colors::BOLD}#{word}#{Colors::END}\nEnter meaning for '#{word}': "
                        input = gets.chomp.strip
                        input.empty? ? nil : input
                      end
                    end

      if word_meaning.nil? || word_meaning.empty?
        puts "#{Colors::WARNING}No meaning provided, skipping.#{Colors::END}"
        return
      end

      add_word(
        word,
        word_meaning,
        ['random', word_info[:source]]
      )

      puts "#{Colors::GREEN}✓ Added random word from #{word_info[:source]}#{Colors::END}"
    rescue StandardError => e
      puts "#{Colors::FAIL}Failed to fetch random word: #{e}#{Colors::END}"
    end
  end

  def discover_words(count = 3)
    puts "#{Colors::CYAN}Discovering #{count} random words...#{Colors::END}"

    begin
      words = @word_fetcher.fetch_multiple_words(count)

      words.each_with_index do |word_info, i|
        puts "\n#{Colors::HEADER}Word ##{i + 1}#{Colors::END}"
        puts "#{Colors::BOLD}#{word_info[:word]}#{Colors::END}"

        if word_info[:definition]
          puts "Definition: #{word_info[:definition]}"
        end

        puts "Source: #{word_info[:source]}"

        print "Add this word? (y/n): "
        response = gets.chomp.downcase
        if response == 'y'
          meaning = word_info[:definition]
          unless meaning
            print "Enter meaning for '#{word_info[:word]}': "
            meaning = gets.chomp.strip
          end

          if meaning && !meaning.empty?
            add_word(
              word_info[:word],
              meaning,
              ['discovered', word_info[:source]]
            )
          else
            puts "#{Colors::WARNING}Skipped - no meaning provided#{Colors::END}"
          end
        else
          puts "Skipped."
        end
      end
    rescue StandardError => e
      puts "#{Colors::FAIL}Failed to discover words: #{e}#{Colors::END}"
    end
  end

  def search_words(pattern, use_regex = false)
    matches = []

    begin
      if use_regex
        regex = Regexp.new(pattern, Regexp::IGNORECASE)
        matches = @db.words.keys.select { |w| w =~ regex }
      else
        pattern_lower = pattern.downcase
        matches = @db.words.keys.select { |w| w.downcase.include?(pattern_lower) }
      end
    rescue RegexpError => e
      raise VocabularyError, "Invalid regex pattern: #{e}"
    end

    matches
  end

  def display_word(word, play_sound = false)
    unless @db.words.key?(word)
      puts "#{Colors::FAIL}✗ Word '#{word}' not found#{Colors::END}"
      return
    end

    entry = @db.words[word]

    # Clear screen for better visibility
    system('clear') || system('cls')

    # Display word
    puts @formatter.format_word_display(entry.word, entry.meaning)

    # Display tags if any
    if entry.tags.any?
      puts "\n#{Colors::CYAN}Tags: #{entry.tags.join(', ')}#{Colors::END}"
    end

    # Display examples if any
    if entry.examples.any?
      puts "\n#{Colors::BLUE}Examples:#{Colors::END}"
      entry.examples.each_with_index do |example, i|
        puts "  #{i + 1}. #{example}"
      end
    end

    # Play sound if requested
    speak_word(word) if play_sound
  end

  def speak_word(text)
    Thread.new do
      case RUBY_PLATFORM
      when /darwin/ # macOS
        system("say #{text}")
      when /linux/ # Linux (requires espeak)
        system("espeak #{text}")
      when /win32|mingw/ # Windows
        system("powershell -Command \"Add-Type -AssemblyName System.Speech; $synth = New-Object System.Speech.Synthesis.SpeechSynthesizer; $synth.Speak('#{text}');\"")
      end
    rescue StandardError => e
      puts "#{Colors::WARNING}Speech failed: #{e}#{Colors::END}"
    end
  end

  def test_session(num_words = nil, play_sound = false, include_random = false)
    test_words = []

    # Add existing words
    if @db.words.any?
      words = @db.words.keys.shuffle
      test_words.concat(words)
    end

    # Add random words if requested
    if include_random
      puts "#{Colors::CYAN}Fetching random words for testing...#{Colors::END}"
      begin
        random_count = [5, num_words || 5].min
        random_words = @word_fetcher.fetch_multiple_words(random_count)
        test_words.concat(random_words.map { |w| w[:word] })
      rescue StandardError => e
        puts "#{Colors::WARNING}Failed to fetch random words: #{e}#{Colors::END}"
      end
    end

    if test_words.empty?
      puts "#{Colors::WARNING}No words to test!#{Colors::END}"
      return
    end

    # Limit number of words if specified
    if num_words
      test_words = test_words.first([num_words, test_words.length].min)
    end

    total = test_words.length
    correct = 0

    puts "\n#{Colors::HEADER}#{'=' * 50}#{Colors::END}"
    puts "#{Colors::BOLD}Starting test session with #{total} words#{Colors::END}"
    puts "#{Colors::HEADER}#{'=' * 50}#{Colors::END}\n"

    test_words.each_with_index do |word, i|
      # Get meaning from database or prompt
      if @db.words.key?(word)
        entry = @db.words[word]
        meaning = entry.meaning
        is_random = false
      else
        meaning = "(random word - no definition in dictionary)"
        is_random = true
      end

      puts "\n#{Colors::CYAN}Word #{i + 1}/#{total}#{Colors::END}"
      puts "#{Colors::WARNING}[Random Word]#{Colors::END}" if is_random
      puts "Meaning: #{meaning}"

      speak_word(word) if play_sound

      print "Your answer (or 'q' to quit): "
      response = gets.chomp.downcase

      break if response == 'q'

      if response == word.downcase
        puts "#{Colors::GREEN}✓ Correct!#{Colors::END}"
        correct += 1
      else
        puts "#{Colors::FAIL}✗ Wrong. Correct answer: #{word}#{Colors::END}"
      end
    end

    # Show results
    if total > 0
      percentage = (correct.to_f / total) * 100
      puts "\n#{Colors::HEADER}#{'=' * 50}#{Colors::END}"
      puts "Results: #{correct}/#{total} correct (#{percentage.round(1)}%)"
      puts "#{Colors::HEADER}#{'=' * 50}#{Colors::END}"
    end
  end

  def show_stats
    if @db.words.empty?
      puts "No words in dictionary."
      return
    end

    total = @db.words.size

    # Calculate word length statistics
    word_lengths = @db.words.keys.map(&:length)
    avg_length = word_lengths.sum.to_f / total

    # Count CJK characters
    cjk_count = @db.words.keys.sum { |w| w.chars.count(&:is_cjk?) }

    # Tag statistics
    all_tags = @db.words.values.flat_map(&:tags)
    tag_counts = all_tags.each_with_object(Hash.new(0)) { |tag, h| h[tag] += 1 }

    # Source statistics (from tags)
    source_tags = all_tags.select { |t| ['random', 'discovered', 'fallback'].include?(t) }
    source_counts = source_tags.each_with_object(Hash.new(0)) { |tag, h| h[tag] += 1 }

    puts "\n#{Colors::HEADER}📊 Vocabulary Statistics#{Colors::END}"
    puts "#{'=' * 40}"
    puts "Total words: #{total}"
    puts "Words with CJK characters: #{cjk_count}"
    puts "Average word length: #{avg_length.round(1)} characters"

    if source_counts.any?
      puts "\n#{Colors::CYAN}Sources:#{Colors::END}"
      source_counts.each do |source, count|
        puts "  #{source}: #{count}"
      end
    end

    if tag_counts.any?
      puts "\n#{Colors::CYAN}Tags:#{Colors::END}"
      tag_counts.sort_by { |_, count| -count }.each do |tag, count|
        next if ['random', 'discovered', 'fallback'].include?(tag)
        puts "  #{tag}: #{count}"
      end
    end

    # Show sample of words
    puts "\n#{Colors::CYAN}Sample words:#{Colors::END}"
    sample = @db.words.keys.sample([5, total].min)
    sample.each do |word|
      entry = @db.words[word]
      tag_str = entry.tags.any? ? " [#{entry.tags.join(', ')}]" : ""
      puts "  • #{word}: #{entry.meaning}#{tag_str}"
    end
  end

  def run_interactive
    help_text = <<~HELP
      #{Colors::HEADER}Vocabulary Learning Tool - Commands#{Colors::END}
      #{Colors::BOLD}#{'=' * 50}#{Colors::END}

        #{Colors::GREEN}add|a <word> <meaning> [tags]#{Colors::END}
              Add a new word (tags separated by commas)
              Example: a hello 你好 greeting,common

        #{Colors::GREEN}random|rand [meaning]#{Colors::END}
              Fetch and add a random word from the internet
              Example: rand - adds random word (prompts for meaning if needed)

        #{Colors::GREEN}discover|d [count]#{Colors::END}
              Discover multiple random words and choose which to add
              Example: discover 5

        #{Colors::GREEN}search|s <pattern> [-r]#{Colors::END}
              Search for words (-r for regex)
              Example: s ^hello -r

        #{Colors::GREEN}show|w <word> [-s]#{Colors::END}
              Display a word (-s to play sound)

        #{Colors::GREEN}test|t [number] [-s] [--random]#{Colors::END}
              Start a test session (--random to include random words)

        #{Colors::GREEN}list|l [tag]#{Colors::END}
              List all words (optionally filter by tag)

        #{Colors::GREEN}stats|st#{Colors::END}
              Show vocabulary statistics

        #{Colors::GREEN}save [filename]#{Colors::END}
              Save vocabulary to file

        #{Colors::GREEN}load [filename]#{Colors::END}
              Load vocabulary from file

        #{Colors::GREEN}export <filename.csv>#{Colors::END}
              Export to CSV format

        #{Colors::GREEN}delete|del <word>#{Colors::END}
              Delete a word

        #{Colors::GREEN}clear#{Colors::END}
              Clear all words

        #{Colors::GREEN}help|h#{Colors::END}
              Show this help

        #{Colors::GREEN}quit|q#{Colors::END}
              Exit the program
    HELP

    puts "#{Colors::HEADER}Vocabulary Learning Tool#{Colors::END}"
    puts "Type 'help' for commands\n"

    while @running
      begin
        print "#{Colors::BOLD}vocab> #{Colors::END}"
        command = gets
        break if command.nil?

        command = command.chomp.strip
        next if command.empty?

        parts = command.split
        cmd = parts[0].downcase

        case cmd
        when 'quit', 'q', 'exit'
          puts "Goodbye!"
          break

        when 'help', 'h'
          puts help_text

        when 'add', 'a'
          if parts.size < 3
            puts "Usage: add <word> <meaning> [tags]"
            next
          end

          word = parts[1]
          meaning = parts[2]
          tags = parts[3]&.split(',')
          add_word(word, meaning, tags)

        when 'random', 'rand'
          meaning = parts[1] if parts.size > 1
          add_random_word(meaning)

        when 'discover', 'd'
          count = parts[1]&.to_i || 3
          discover_words(count)

        when 'search', 's'
          if parts.size < 2
            puts "Usage: search <pattern> [-r]"
            next
          end

          pattern = parts[1]
          use_regex = parts.include?('-r')
          matches = search_words(pattern, use_regex)

          if matches.any?
            puts "\nFound #{matches.size} matches:"
            matches.each do |word|
              entry = @db.words[word]
              tag_str = entry.tags.any? ? " [#{entry.tags.join(', ')}]" : ""
              puts "  • #{word}: #{entry.meaning}#{tag_str}"
            end
          else
            puts "No matches found."
          end

        when 'show', 'w'
          if parts.size < 2
            puts "Usage: show <word> [-s]"
            next
          end

          word = parts[1]
          play_sound = parts.include?('-s')
          display_word(word, play_sound)

        when 'test', 't'
          num_words = parts[1]&.to_i if parts.size > 1 && parts[1] =~ /^\d+$/
          play_sound = parts.include?('-s')
          include_random = parts.include?('--random')
          test_session(num_words, play_sound, include_random)

        when 'list', 'l'
          tag_filter = parts[1] if parts.size > 1

          words = @db.words.to_a
          if tag_filter
            words = words.select { |_, e| e.tags.include?(tag_filter) }
          end

          if words.any?
            puts "\n#{Colors::CYAN}Words:#{Colors::END}"
            words.sort_by { |w, _| w }.each do |word, entry|
              tag_str = entry.tags.any? ? " [#{entry.tags.join(', ')}]" : ""
              puts "  • #{word}: #{entry.meaning}#{tag_str}"
            end
            puts "\nTotal: #{words.size}"
          else
            puts "No words found."
          end

        when 'stats', 'st'
          show_stats

        when 'save'
          filename = parts[1] if parts.size > 1
          @db.save(filename)

        when 'load'
          filename = parts[1] if parts.size > 1
          @db.load(filename)

        when 'export'
          if parts.size < 2
            puts "Usage: export <filename.csv>"
            next
          end
          @db.export_csv(parts[1])

        when 'delete', 'del'
          if parts.size < 2
            puts "Usage: delete <word>"
            next
          end

          word = parts[1]
          if @db.words.key?(word)
            @db.words.delete(word)
            puts "#{Colors::GREEN}✓ Deleted '#{word}'#{Colors::END}"
          else
            puts "#{Colors::FAIL}✗ Word not found#{Colors::END}"
          end

        when 'clear'
          print "Are you sure? (y/n): "
          response = gets.chomp.downcase
          if response == 'y'
            @db.words.clear
            puts "Dictionary cleared."
          end

        else
          puts "#{Colors::WARNING}Unknown command. Type 'help' for available commands.#{Colors::END}"
        end

      rescue Interrupt
        puts "\nUse 'quit' to exit"
      rescue StandardError => e
        puts "#{Colors::FAIL}Error: #{e}#{Colors::END}"
      end
    end
  end
end

# Command-line interface
if __FILE__ == $PROGRAM_NAME
  require 'optparse'

  options = {}
  OptionParser.new do |opts|
    opts.banner = "Usage: #{$PROGRAM_NAME} [options]"

    opts.on('-f', '--file FILE', 'Data file to use') do |f|
      options[:file] = f
    end

    opts.on('-a', '--add WORD,MEANING', Array, 'Add a word and exit') do |a|
      options[:add] = a
    end

    opts.on('--random', 'Fetch and display a random word') do
      options[:random] = true
    end

    opts.on('--discover COUNT', Integer, 'Discover multiple random words') do |c|
      options[:discover] = c
    end

    opts.on('-s', '--search PATTERN', 'Search for a word and exit') do |p|
      options[:search] = p
    end

    opts.on('--stats', 'Show statistics and exit') do
      options[:stats] = true
    end

    opts.on('-h', '--help', 'Show this help') do
      puts opts
      exit
    end
  end.parse!

  app = VocabularyApp.new(options[:file])

  if options[:random]
    word_info = app.instance_variable_get(:@word_fetcher).fetch_random_word
    puts "Random word: #{word_info[:word]}"
    puts "Definition: #{word_info[:definition]}" if word_info[:definition]
    puts "Source: #{word_info[:source]}"
  elsif options[:discover]
    words = app.instance_variable_get(:@word_fetcher).fetch_multiple_words(options[:discover])
    words.each_with_index do |word_info, i|
      puts "#{i + 1}. #{word_info[:word]} [#{word_info[:source]}]"
      puts "   #{word_info[:definition]}" if word_info[:definition]
    end
  elsif options[:add]
    app.add_word(options[:add][0], options[:add][1])
    app.instance_variable_get(:@db).save
  elsif options[:search]
    matches = app.search_words(options[:search])
    matches.each do |word|
      entry = app.instance_variable_get(:@db).words[word]
      puts "#{word}: #{entry.meaning}"
    end
  elsif options[:stats]
    app.show_stats
  else
    app.run_interactive
  end
end