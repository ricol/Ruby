#!/usr/bin/env ruby

a = 1
b = 1.234
c = "c"
d = "wangxinghe"
e = 1..10
f = 1...10
g = true
h = nil
i = "A"

# define constant
Name = "ricol".freeze
puts Name
Name = "wang".freeze # generate a warning because it is a constant value
puts Name

def printInfor(data)
  puts "class: #{data.class} -> value: #{data}"
end

[a, b, c, d, e, f, g, h, i].each do |data|
  printInfor(data)
end

puts 1.class
puts 1.0.class
puts "one".class
puts "tow".class
puts /three/.class
puts "a".class

puts 0o377
puts 0b11111111
puts 0xFF
puts format("pi is about: %.4f", Math::PI)
puts format("%s: %f", "pi", Math::PI)

puts 0.0
puts -3.14
puts 6.02e23
puts 1_000_000.01

puts "don't worry about escaping ' characters!"
puts %("how are you?", he said)
puts %(This string literal ends with a newline\n)
