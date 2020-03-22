#!/usr/local/bin/ruby

a = []

n = 10
n.times do
  a << rand(n)
end

puts "Before...a: #{a}"
b = a.sort
puts "After...b: #{b}"
puts "After...a: #{a}"
a.sort!
puts "After...a: #{a}"
