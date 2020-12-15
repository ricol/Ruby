#!/usr/bin/env ruby

ARGV.each do |x|
  puts x
end

if ARGV.length >= 1
  filename = ARGV.first
  puts "demo open..."
  file = open(filename)

  puts "Opening your file #{filename}"
  puts "Content: \n#{file.read}"

  puts "demo File.open..."
  File.open(filename, "r") do |file|
    puts "#{filename}: " + file.read
  end
end
