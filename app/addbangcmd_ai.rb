#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require "find"

# Constants for shebang and encoding declarations
SHEBANG_STANDARD = "#!/usr/bin/python"
SHEBANG_LOCAL = "#!/usr/local/bin/python"
SHEBANG_ENV = "#!/usr/bin/env python"
CODING_UTF8 = "# -*- coding: utf-8 -*-"
CODING_UTF = "# -*- coding:utf -*-"

class FileProcessor
  def self.get_files(directory, file_extension)
    result = []
    Find.find(directory) do |path|
      next unless File.file?(path)
      next if path.include?("addbangcmd")
      if File.extname(path) == file_extension
        result << path
      end
    end
    result
  end

  def self.clean_content(content)
    lines = content.split("\n")
    processed = false

    # Remove header lines
    while !lines.empty? && should_remove_line?(lines.first)
      lines.shift
      processed = true
    end

    # Clean up empty lines
    cleaned_lines = remove_excessive_empty_lines(lines)

    if processed
      [cleaned_lines.join("\n"), true]
    else
      [content, false]
    end
  end

  def self.should_remove_line?(line)
    line_stripped = line.strip
    [SHEBANG_STANDARD, SHEBANG_LOCAL, SHEBANG_ENV, CODING_UTF8, CODING_UTF, ""].include?(line_stripped) ||
      (line_stripped.include?("coding") && line_stripped.include?("utf")) ||
      line_stripped.include?("usr/bin/") ||
      line_stripped.start_with?("#!")
  end

  def self.remove_excessive_empty_lines(lines)
    cleaned_lines = []
    last_line_empty = false

    lines.each do |line|
      is_empty = line.strip.empty?
      if is_empty
        unless last_line_empty
          cleaned_lines << ""
          last_line_empty = true
        end
      else
        cleaned_lines << line
        last_line_empty = false
      end
    end

    cleaned_lines
  end

  def self.process_file(file_path, content, add_header)
    if add_header
      lines = content.split("\n")
      if lines.size >= 3 &&
         lines[0] == SHEBANG_ENV &&
         lines[1] == CODING_UTF8 &&
         lines[2] == ""
        return false
      end

      cleaned_content, _ = clean_content(content)
      lines = cleaned_content.split("\n")
      lines.unshift("", CODING_UTF8, SHEBANG_ENV)
      save_file(file_path, lines.join("\n"))
    else
      cleaned_content, was_processed = clean_content(content)
      if was_processed
        save_file(file_path, cleaned_content)
      else
        false
      end
    end
  end

  def self.save_file(file_path, content)
    begin
      File.write(file_path, content)
      true
    rescue => e
      STDERR.puts "Error[#{file_path}]: #{e}"
      false
    end
  end
end

def main
  if ARGV.size <= 1
    puts "Usage: addbangcmd.rb --add|--remove <directory>"
    exit(1)
  end

  option = ARGV[0]
  unless ["--add", "--remove"].include?(option)
    puts "Invalid operation!"
    exit(1)
  end

  directory = ARGV[1]
  file_extension = ".py"

  puts "Searching for #{file_extension} files in #{directory}"
  files = FileProcessor.get_files(directory, file_extension)
  total_files = files.size
  ignored = 0
  updated = 0

  files.each do |file_path|
    begin
      content = File.read(file_path)
      puts "Processing...#{file_path}"
      if FileProcessor.process_file(file_path, content, option == "--add")
        updated += 1
      else
        ignored += 1
      end
    rescue => e
      STDERR.puts "Error reading #{file_path}: #{e}"
      ignored += 1
    end
  end

  puts "\nResult:"
  puts "Total[#{file_extension}]: #{total_files}"
  puts "Updated: #{updated}"
  puts "Ignored: #{ignored}"
end

main if __FILE__ == $0
