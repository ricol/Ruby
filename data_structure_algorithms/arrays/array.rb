#!/usr/bin/env ruby

the_count = [1, 2, 3, 4, 5]
fruits = %w[apples oranges pears apricots]
change = [1, "pennies", 2, "dimes", 3, "quarters"]

for number in the_count
  puts "this is count #{number}"
end

fruits.each do |fruit|
  puts "A fruit of type: #{fruit}"
end

change.each do |i|
  puts "i got #{i}"
end

elements = []

(0..5).each do |i|
  puts "adding #{i} to the list"
  elements.push(i)
end

elements.each do |i|
  puts "Elements was: #{i}"
end

myData = [1, 2, 3, 4, 5, 6, 7]
result = myData.find { |value| value == 7 }
puts "result: #{result}"

myData = %w[ricol wang Ricol Wang]
result = myData.find { |value| value == "Ricol" }

puts "result: #{result}"

a = [1, 2, 3, 4]
puts a
b = a.map { |x| x * x }
puts b
c = a.select(&:even?)
puts c
a.inject do |sum, x|
  sum + x
end
puts a

puts "demo a..."
a = %w[ricol wang xing he]
puts a.first
puts a.last
puts a.sort
puts a.length

puts "demo b..."
b = [2, 3, 4, 1, 0, 2, 3, 2]
puts b.length
puts b.first
puts b.last
puts b.sort

(1..10).each do |x|
  print x.to_s + " "
end
puts ""

(1..10).each_with_index do |x, i|
  print i.to_s + " - " + x.to_s + "\n"
end

puts ""

a = [1, 2, 3]
puts a.join
puts a.join(", ")

def putData(a)
  puts "data: #{a}"
  puts "class: #{a.class}"
end

a = %w[abc ABC 123]
putData a
b = "abc", "ABC", "123"
putData b
c = %w[abc ABC 123]
putData(c)

a = [1, 2, 3]
puts "a: #{a}"
a = [0..10, -1...-10]
puts "a: #{a}"
a = [[1, 2], [3, 4], "a", 1, true]
puts "a: #{a}"

a = []
puts "a: #{a}"
a = Array.new(3)
puts "a: #{a}"

a = (0..10).to_a
puts "a: #{a}"

b = (-10..0).to_a
c = a + b
puts "b: #{b}"
puts "c: #{c}"

d = a - b
puts "d: #{d}"

a = []
a << 1
a << "ABC"
a << true
a << [4, 5, 6]

puts "a: #{a}"

a = (1..10).to_a
b = (5..15).to_a
c = a + b
d = a - b
e = a | b
f = a & b
puts "a: #{a}"
puts "b: #{b}"
puts "c: #{c}"
puts "d: #{d}"
puts "e: #{e}"
puts "f: #{f}"

a = [1, 2, 3]
s = a.join
puts "s: #{s}"
s = a.join(", ")
puts "s: #{s}"

a = Array.new(10)
(0..a.length - 1).each do |x|
  a[x] = rand(10)
end

puts "a: #{a}"

words = %w[this is a test]
puts words

words = %w|({]][[asdfasfdadsf|
puts words

white = %W[\s \t \r \n]
puts white

a = [1, 2, 3, 4, 5]
b = [1, 2, 3]
c = a - b
puts c

a = [1, 2, 3, 4, 5]
b = [3, 5, 8]
c = a | b
d = a & b
puts c
puts d
