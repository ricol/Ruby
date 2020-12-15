#!/usr/bin/env ruby

$factorial = {}

def factorial(n)
  return $factorial[n] if $factorial[n]
  if n <= 1
    $factorial[n] = 1
  else
    $factorial[n] = n * factorial(n - 1)
  end
  return $factorial[n]
end

def calculate_e(n)
  s = 0
  for x in (0..n)
    s += 1.0 / factorial(x)
  end
  return s
end

if ARGV.size <= 0
  puts "Usage: rb <times>"
  exit
end
n = ARGV.last.to_i
puts "#{n} -> e = #{calculate_e(n)}"
