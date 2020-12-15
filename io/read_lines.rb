#!/usr/bin/env ruby

lines = IO.readlines(ARGV.first)
lines.each_with_index do |line, i|
  puts "#{i}: " + line
end
puts "Total Lines: #{lines.count}"
