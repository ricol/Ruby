#!/usr/local/bin/ruby

if ARGV.length <= 1
  print("Usage: replacetab.rb <filename> <spacenumber>\n")
  exit
end

filename, spacenumber = ARGV[0], ARGV[1].to_i
puts "Processing #{filename} with space numbers: #{spacenumber}"
File.open(filename, 'r+') do |f| 
  lines = f.readlines()
  newlines = []
  for l in lines
    newlines << l
  end
  f.write(newlines)
end
File.open(filename, 'r') do |f| puts f.readlines end
