#!/usr/bin/env ruby

o = "message"

def o.printMe
  puts self
end

o.printMe

def printObjects(a, *b)
  puts "a: #{a}"
  b.each do |x|
    puts "x: #{x}"
  end
end

def printObjectsWithBlock(a, *b)
  printObjects(a, *b)

  yield
  yield(a)
  yield(a, *b)
  yield(a, b)
end

def printObjectsWithBlockNew(a, *b, block)
  printObjectsWithBlock(a, *b, &block)
end

puts "demo printObjects..."
printObjects("wangxinghe", "ricolwang", "qianchunyan", "wangdan")
puts "demo printObjects..."
printObjects("wangxinghe") do |x|
  puts "x: #{x}"
end

puts "demo printObjectsWithBlock..."
printObjectsWithBlock("wangxinghe", "ricolwang", "qianchunyan", "wangdan") do |a, b|
  puts "in block: a: #{a}, b: #{b}"
end

b = proc { |a, b| puts "in block: a: #{a}, b: #{b}" }

printObjectsWithBlockNew("wangxinghe", "ricolwang", "qianchunyan", "wangdan", b)
