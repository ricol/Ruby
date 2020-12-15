#!/usr/bin/env ruby

# Print the numbers 1 to 5
1.upto(5) { |x| puts x }
1.upto(5) do |x|
  puts x
end
1.upto(5) do |x|
  puts x
end

puts "demo next..."
array = [3, 2, 3, 12, 3]
array.collect do |x|
  if x.nil?
    0
  else
    [x, x * x]
  end
end

puts array

array.collect do |x|
  next 0 if x.nil?
  next x, x * x
end

puts array

total = 0
array.each do |x|
  total += x
end
puts "total = " + total.to_s

puts "Demo blocks..."

def test
  puts "You are in the method"
  yield
  puts "You are again back to the method"
end

test do
  puts "You are in the block!"
end

test do
  puts "You are in another block!"
end
