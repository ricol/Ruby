#!/usr/bin/env ruby

puts "accessing: " + __FILE__
lines = IO.readlines(__FILE__)
lines.each_with_index do |line, i|
  puts "#{i}: " + line
end
puts "Total Lines: #{lines.count}"
