#!/usr/bin/env ruby

if ARGV.empty?
  puts "Usage: app <source> [target]"
  exit
end
source = ARGV[0]
target = ARGV[1]
target ||= source
puts "Formatting from #{source} to #{target}"
if File.exist?(source)
  in_file = open(source)
  indata = in_file.read
  puts "source length: #{indata.length} bytes long"
  puts "formatting..."
  result = ""
  indata.each_line do |line|
    newLine = ""
    i = 0
    i += 1 while line[i] == " "
    j = 0
    while j < line.length
      previous = j - 1 if char == "{"
      newLine << char
      j += 1
    end
    result << newLine
  end
  if result != ""
    out_file = open(target, "w")
    out_file.write(result)
  end
  puts "complete."
else
  puts "#{souce} doesn't exist."
end
