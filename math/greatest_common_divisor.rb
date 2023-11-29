#!/usr/bin/env ruby

def find(a, b)
  min = a > b ? b : a
  max = a > b ? a : b

  t = max - min
  r = max % min

  while r != 0
    t = min - r
    r = min % r
    min = r
  end

  return min
end

def find_recursive(a, b)
  return 1 if a <= 0 || b <= 0
  return a if a == b
  return find_recursive(a - b, b) if a > b
  return find_recursive(a, b - a) if b > a
end

def check(a, b)
  lowest = a > b ? b : a
  lowest.downto(1) do |t|
    return t if a % t == 0 && b % t == 0
  end
end

if ARGV.size <= 1
  puts "Usage: rb <num1> <num2>"
  exit
end
a = ARGV.first.to_i
b = ARGV.last.to_i
v1 = find_recursive(a, b)
v2 = check(a, b)
puts "gcd(#{a}, #{b}): #{v1}[#{v2}]\t#{"Error" if v1 != v2}"
