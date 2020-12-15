#!/usr/bin/env ruby

def f(x)
  return x * x * x + x * x + x
end

def g(x)
  return (1 / 4.0) * x * x * x * x + (1 / 3.0) * x * x * x + (1 / 2.0) * x * x
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

puts "calculating..."
STDOUT.flush
N = 1e7
a = 1.0
b = 100.0
s = calculus(a, b, N)
puts "a: #{a} , b: #{b} n: #{N}"
puts "s: #{s}"
answer = g(b) - g(a)
puts "checking...#{answer}"
puts "difference: #{(answer - s)}"
