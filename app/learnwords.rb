#!/usr/bin/env ruby

# words
# -a <word> <meanning> #add a new word
# -s [filename] #save to a local file
# -r [filename] #load from a local file
# -tr #display words in random order
# -to #display words in alphabetic order
LENGTH_LINE = 80

class String
  def is_chinese?
    bytesize > 1
  end
end

class MyLibrary
  DEFAULT_FILE_NAME = "./words.dat".freeze

  def initialize(filename = DEFAULT_FILE_NAME)
    @data = {}
    load(filename)
  end

  def save(filename = DEFAULT_FILE_NAME)
    filename ||= DEFAULT_FILE_NAME
    File.open(filename, "w") do |file|
      @data.each do |key, value|
        file.puts(key + "|" + value) if value
      end
      puts "#dictionary saved to #{filename}"
    end
  end

  def load(filename = DEFAULT_FILE_NAME)
    filename ||= DEFAULT_FILE_NAME
    if File.exist?(filename)
      content = File.open(filename, "r").readlines
      content.each do |line|
        line.chomp!
        a = line.split("|")
        add(a[0], a[1])
      end
      puts "#dictionary loaded from #{filename}"
      puts "#total: #{@data.count}"
    else
      puts "##{filename} doesn't exist."
    end
  end

  def add(word, meaning)
    if word && meaning
      @data[word] = meaning
      puts "##{word}: #{meaning} added."
    end
  end

  def remove(word)
    return unless word
    if @data[word]
      @data.delete(word)
      puts "##{word} removed."
    else
      puts "##{word} not found!"
    end
  end

  def clear
    @data = {}
    puts "#dictionary cleared."
  end

  def search_word(pattern)
    begin
      nil unless pattern
      r = Regexp.new(pattern)
      @data.keys.each do |word|
        return word if r =~ word
      end
    rescue Exception => e
      puts "exception: #{e}"
      return nil
    end
    nil
  end

  def get_word(total = @data.size)
    data = @data.keys.shuffle
    index = 0
    data.each do |word|
      index += 1
      yield word, index
      return if index >= total
    end
  end

  def format(character, word, length, character_type = 1)
    s = ""
    index = 0
    length_of_word = 0
    word.chars do |c|
      length_of_word += 1
      length_of_word += 1 if c.is_chinese?
    end
    left = (length - length_of_word) / 2 - 1
    s += character
    index += 1
    new_character = character
    new_character = " " if character_type != 1
    (left - 1).times do
      s += new_character
      index += 1
    end
    s += word
    index += length_of_word
    while index < length - 1
      s += new_character
      index += 1
    end
    s += character
    s
  end

  def show_word(word, play = false)
    length = LENGTH_LINE
    puts format("=", "WORD", length)
    puts format("=", word, length, 2)
    puts format("=", @data[word], length, 2)
    puts format("=", "", length)
    say word if play
  end

  def say(word)
    cmd = "say #{word}"
    Thread.start do
      system(`#{cmd}`)
    end
  end

  def test(total, sound = 0)
    total = total ? total.to_i : @data.size
    puts "begin."
    get_word(total) do |aWord, index|
      show_word(aWord, sound)
      puts "#{index}/#{total}"
      puts "#? <quit to exit>"
      response = gets.chomp!.downcase
      while response != aWord && response != "quit"
        puts "#wrong!"
        say "you are wrong!" if sound == 1
        show_word(aWord)
        puts "#again? <quit to exit>"
        response = gets.chomp!.downcase
      end
      return if response == "quit"
      puts "#greate! next."
    end
    puts "complete."
  end

  def to_s
    s = ""
    @data.each do |key, value|
      s += "#{key}: #{value}\n" if value
    end
    s
  end

  def run
    doc = <<doc
Menu:
==============================================
  i [word] [meaning] - insert a new word
  r [word]           - remove a word
  s [filename]       - save to a local file
  l [filename]       - load from a local file
  d [pattern] [-s]   - display a word
  a                  - display all words
  c                  - clear all words in the memory
  t [total]          - run words test
  q                  - quit
==============================================
Your command?
doc
    loop do
      puts doc
      response = gets
      response.chomp!
      commands = response.split
      case commands[0]
      when "s"
        save commands[1]
      when "l"
        load commands[1]
      when "c"
        clear
      when "d"
        word = search_word(commands[1])
        bSay = commands[2] || false
        bSay = bSay == "-s"
        word ? show_word(word, bSay) : puts("#word not found!")
      when "a"
        puts "#dictionary: \n#{self}"
        puts "#total: #{@data.count}"
      when "t"
        test commands[1], commands[2].to_i
      when "q"
        return
      when "i"
        word = commands[1]
        meaning = commands[2]
        word && meaning ? add(word, meaning) : puts("#command not complete!")
      when "r"
        commands[1] ? remove(word) : puts("#command not complete!")
      else
        puts "#invalid command!"
      end
    end
  end
end

library = MyLibrary.new
library.run
