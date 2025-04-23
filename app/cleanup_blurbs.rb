#!/usr/bin/env ruby

def find_file(directory, filename, recursive: true)
  Dir.children(directory).each do |entry|
    full_path = File.join(directory, entry)

    if File.file?(full_path) && entry == filename
      return full_path
    elsif recursive && File.directory?(full_path)
      found = find_file(full_path, filename, recursive: true)
      return found unless found.nil?
    end
  end
  nil
end

def search_in_code_files(blurbs, directory, options = {})
  # Default options
  options = {
    recursive: true,       # Search in subdirectories
    case_sensitive: false, # Case-insensitive by default
    file_types: [:swift, :objc], # Search both Swift and Objective-C
    verbose: false,        # Show progress
  }.merge(options)

  # Define file patterns based on requested file types
  patterns = []
  patterns << "*.swift" if options[:file_types].include?(:swift)
  patterns << "*.{h,m}" if options[:file_types].include?(:objc)

  return 0, 0 if patterns.empty?

  file_pattern = "{#{patterns.join(",")}}"
  glob_pattern = File.join(directory, options[:recursive] ? "**" : "*", file_pattern)

  Dir.glob(glob_pattern).each do |file_path|
    next unless File.file?(file_path) # Skip directories

    $files_searched += 1
    puts "Searching in #{file_path}..." if options[:verbose]

    begin
      File.foreach(file_path).with_index(1) do |line, line_num|
        text = options[:case_sensitive] ? line : line.downcase
        for search_term in blurbs
          # Prepare search term and line based on case sensitivity
          raw_term = options[:case_sensitive] ? search_term : search_term.to_s.downcase
          if text.match?(/\D#{raw_term}\D/)
            $mapping[raw_term] = $mapping[raw_term].to_i + 1
            # Colorize the output for better visibility
            # highlighted_line = line.gsub(/(#{Regexp.escape(search_term)})/i, "\e[31m\\1\e[0m")
            # puts "\e[32m#{file_path}\e[0m (line #{line_num}): #{highlighted_line.strip}"
          end
        end
      end
    rescue => e
      puts "Error reading #{file_path}: #{e.message}" if options[:verbose]
      $error += 1
    end
  end
end

file_to_find = "blurbs.txt"

if ARGV.empty?
  puts "Usage: cleanup_blurbs.rb <directory>"
  exit
end

directory_to_search = ARGV.last.to_s

$mapping = {}
$blurbs = []
$error = 0
$files_searched = 0

result = find_file(directory_to_search, file_to_find)
if !result
  puts "File not found in the specified directory"
  exit
end

puts "File found at: #{result}"
File.foreach(result) do |line|
  # Remove whitespace and skip empty lines
  line.strip!
  line = line.to_s
  next if line.empty?
  $blurbs << line
  $mapping[line] = 0
end
$blurbs.uniq!
puts "processing..."
search_in_code_files($blurbs, directory_to_search)
$notused = []
$mapping.each do |k, v| $notused << k if v == 0 end
$blurbs = $blurbs.uniq
$notused = $notused.uniq
puts $notused.join(",")
puts "result: blurbId not used: #{$notused.count}, error: #{$error}, total file searched: #{$files_searched}"
blurbs_id = ($blurbs.uniq - $notused.uniq).sort
File.write(result, blurbs_id.join("\n"))
puts "#{result} updated."
