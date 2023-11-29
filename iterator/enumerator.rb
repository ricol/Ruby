#!/usr/bin/env ruby

def printIterator(iterator)
  loop { puts iterator.next }
rescue Exception => e
  puts "Exception: #{e}"
end

iterator = 9.downto(1)
printIterator(iterator)
iterator = 1.upto(10)
printIterator(iterator)
iterator = [1, 2, 3, 4, 5, 6, 7, 8, 9].each
printIterator(iterator)
iterator = { ricol: 32, wang: 31, qianchunyan: 28 }.each
printIterator(iterator)
iterator = (1..10).each
printIterator(iterator)
iterator = (1...10).each
printIterator(iterator)

0.upto(10) do |x|
  puts x.to_s
end

10.downto(0) do |x|
  puts x.to_s
end

0.1.step(2.0, 0.1) do |x|
  printf("%.10f\n", x)
end

a = (1..10)
a.each do |x|
  puts x
end
a.each_with_index do |x, i|
  puts "#{i}: #{x}"
end

z = []
n = 10
n.times do
  z << rand(n)
end

puts "before z: #{z}"
z.sort! { |a, b| b <=> a }
puts "after z: #{z}"
z.sort! { |a, b| a <=> b }
puts "after z: #{z}"

puts "z.min: #{z.min}"
puts "z.max: #{z.max}"
puts "z.count: #{z.count}"
puts "z.length: #{z.length}"

puts "z.include? 2: #{z.include? 2}"
puts "z.member? 1: #{z.member? 1}"

z.each do |x|
  puts x
end

z.reverse_each do |x|
  puts x
end

data = [[1, 2], [0, 1], [7, 8]]
puts (data.find { |x| x.include? 1 }).to_s
puts (data.detect { |x| x.include? 3 }).to_s

hash = { a: 1, b: 2, c: 3 }
puts "hash.length: #{hash.length}"
puts "hash.size: #{hash.size}"
puts "hash.keys: #{hash.keys}"
puts "hash.values: #{hash.values}"
puts "hash.to_a: #{hash.to_a}"
puts "hash.flatten: #{hash.flatten}"

hash.each do |x|
  puts x
end

hash.each do |key, value|
  puts key, value
end

hash.each_key do |key|
  puts key
end

hash.each_value do |value|
  puts value
end

require "Set"

def printSet(s)
  str = "Set["
  s.each do |x|
    str << x.to_s
    str << " "
  end
  str[str.size - 1] = ""
  str << "]"
  puts str
end

s = Set.new(1..3)
puts "s: #{s}"
printSet(s)
puts "s.include? 1: #{s.include? 1}"
puts "s.member? 0: #{s.member? 0}"

s_new = Set.new(4..10)
printSet(s_new)

puts "&: "
printSet(s & s_new)
puts "|: "
printSet(s | s_new)
puts "^: "
printSet(s ^ s_new)
