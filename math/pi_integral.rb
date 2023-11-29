#!/usr/bin/env ruby

def f(x)
  return 1.0 / (1 + x ** 2)
end

def calculus(a, b, n)
  result = 0.0
  del = (b - a) / n
  (1..n).each do |i|
    x = a + del * i
    y = f(x)
    s = del * y
    result += s
  end
  return result
end

if ARGV.size <= 0
  puts "usage: rb <count of segments>"
  exit
end
N = ARGV.last.to_i
puts "calculating..."
STDOUT.flush
a = 0.0
b = 1
s = calculus(a, b, N)
puts "a: #{a} , b: #{b} n: #{N}"
puts "s: #{s}\nPI: #{4 * s}"
