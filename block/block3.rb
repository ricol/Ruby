#!/usr/bin/env ruby

if ARGV.length <= 0
  puts "Usage: ruby blockArray.rb <number>"
  exit
end

class Array
  def updateValue
    each_with_index do |n, i|
      num = yield(n)
      puts "n: #{n}, i: #{i}, yield(#{n}): #{num}"
      self[i] = num
    end
  end

  def updateValueWithProc(code)
    each_with_index do |n, i|
      num = code.call(n)
      self[i] = num
    end
  end
end

a = [1, 2, 3, 4]
puts "Before..."
puts "a: #{a}"
a.updateValue do |n|
  n ** ARGV[0].to_i
end

puts "after..."
puts "a: #{a}"

a.updateValue do |n|
  ARGV[0].to_i.times do |_x|
    n += n
  end

  n
end

puts "after again..."
puts "a: #{a}"

a = [1, 2, 3, 4]
b = a.dup

puts "before..."
puts "b: #{b}"

b.updateValue do |n|
  m = n

  puts "m: #{m}"

  count = 0
  2.upto(ARGV[0].to_i) do
    m += n
    count += 1
    puts "--<#{count}>m: #{m}"
  end

  puts "-> m: #{m}"
  m
end

puts "after..."
puts "b: #{b}"

c = a.dup
puts "before..."
puts "c: #{c}"

c.updateValue do |n|
  n * ARGV[0].to_i
end

puts "after..."
puts "c: #{c}"

d = a.dup

puts "before..."
puts "d: #{d}"

square = proc do |n|
  n ** ARGV[0].to_i
end

d.updateValueWithProc(square)

puts "after..."
puts "d: #{d}"

d.updateValueWithProc(proc do |n|
  n ** (1.0 / ARGV[0].to_i)
end)

puts "after..."
puts "d: #{d}"
