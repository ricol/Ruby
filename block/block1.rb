#!/usr/bin/env ruby

def print_blocks(s)
  yield s if block_given?
  puts s.to_s
end

s = "wangxinghe"

puts "Demo no block..."
print_blocks(s)
puts "Demo no block again..."
print_blocks s
puts "Demo block..."
print_blocks(s) do |_x|
  puts "s: #{s}"
end
