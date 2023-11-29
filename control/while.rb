#!/usr/bin/env ruby

i = 0
numbers = []

puts "test while..."
while i < 6
  puts i
  numbers.push(i)
  i += 1
end

x = 0
puts x += 1 while x < 10

x = 0
while x < 10 do puts x += 1 end

puts "test until..."
x = 0
until x > 10
  puts x
  x += 1
end

puts "test .each..."

numbers.each do |num|
  puts num
end

puts "test for in..."

array = [1, 2, 3, 4, 5]
for element in array
  puts element
end

hash = { a: 1, b: 2, c: 3 }
for key, value in hash
  puts "#{key}=>#{value}"
end

puts "test do.each"
array.each do |x|
  puts x
end

hash.each do |key, value|
  puts "#{key}=>#{value}"
end

num = 0
loop do
  p "num: #{num}"
  num += 1
  break if num >= 10
end
p "end"
