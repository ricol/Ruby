#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

def sum(*data)
  sum = 0
  data.each do |num| sum += num end
  sum
end

a = []
num = 100
num.times do a << rand(num) end

puts "a: #{a}"

puts "sum of (1, 2, 3): #{sum(1, 2, 3)}"
puts "sum of (1, 2, 3, 4, 5, 6): #{sum(1, 2, 3, 4, 5, 6)}"
puts "sum of a: #{sum(*a)}"

begin
  puts "sum of a: #{sum(a)}"
rescue Exception => e
  puts "Exception: #{e}"
ensure
  puts "end."
end

def calculate(hash)
  start = hash[:start]
  count = hash[:count]
  step = hash[:step]
  puts "start: #{start}, step: #{step}, count: #{count}"

  a = []
  i = 1
  count.times do
    a << start + step * (i - 1)
    i += 1
  end
  a
end

hash = { :start => 1, :count => 10, :step => 2 }
puts "calculate: #{calculate(hash)}"
puts "calculate: #{calculate(:start => 1, :count => 10, :step => 2)}"
puts "calculate: #{calculate start: 1, count: 10, step: 2}"
