#!/usr/bin/env ruby

def f(x)
  return x * x + x + 1
end

def derivative_f(x)
  return 2 * x + 1
end

if ARGV.count != 3
  puts "Usage: derivative.rb <x> <start> <step>"
  exit 0
end

num, start, step = ARGV
num, start, step = num.to_f, start.to_f, step.to_f
del_x = start
puts "Num: #{num}, Start: #{start}, Step: #{step}..."

while del_x > 0
  del_x -= step
  derivative = (f(num + del_x) - f(num)) / del_x
  puts("del_x: #{del_x} -> derivative: #{derivative}[#{derivative_f(num)}]")
end
