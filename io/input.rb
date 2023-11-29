#!/usr/bin/env ruby

puts "x = "
x = gets.chomp.to_i
puts "y = "
y = gets.chomp.to_i
puts "#{x} + #{y} = #{x + y}"
puts "name = ?"
name = gets
puts "#{name}"
puts "age = ?"
age = gets.to_i
puts "#{age}"

def convert(a)
  b = []
  a.each do |number|
    b << number.to_s(16)
  end
  b
end

puts "begin..."
loop do
  s = gets
  puts "s: #{s}"
  b = convert(s.bytes)
  puts "s.bytes: #{b}"
  b = convert(s.chomp.bytes)
  puts "s.chomp.bytes: #{b}"
  break if s.chomp == "quit"
end
puts "end."
