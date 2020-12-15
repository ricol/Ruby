#!/usr/bin/env ruby

a = [1, 2, 3, 4]

b = a.map { |x| x * x }
puts "a: #{a}"
puts "b: #{b}"

c = a.select(&:even?)
puts "c: #{c}"

d = a.inject do |sum, x|
  sum + x
end

puts "d: #{d}"
