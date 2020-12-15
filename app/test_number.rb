#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
a = [1, 2, 3, 4, 5]
# create a method for a single object only
def a.sum
  puts "a.sum..."
  sum = 0
  each do |num|
    sum += num
  end
  sum
end

# add a method sum to class Array
class Array
  def sum
    puts "Array.sum..."
    sum = 0
    each do |num|
      sum += num
    end
    sum
  end

  def *(a)
    result = []
    each do |num|
      a.each do |number|
        result << num * number
      end
    end
    result
  end
end

b = [11, 12, 13, 14, 15]
puts "a.sum: #{a.sum}"
puts "b.sum: #{b.sum}"
puts "a + b: #{a + b}"
puts "a * b: #{a * b}"
