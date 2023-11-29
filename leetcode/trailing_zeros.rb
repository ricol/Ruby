#!/usr/bin/env ruby

# @param {Integer} n
# @return {Integer}

def factorial(n)
  f = 1
  n.downto(1) do |x|
    f *= x
  end
  return f
end

def trailing_zeroes(n)
  f = factorial(n)

  count = 1
  r = f % 10 ** count
  while r == 0
    count += 1
    r = f % 10 ** count
  end

  return count - 1
end

def trailing_zeroes1(n)
  f = 1
  count = 0
  n.downto(1) do |x|
    f *= x
  end
  return f
end

for k, v in { 3 => 0, 5 => 1, 0 => 0, 7 => 1 }
  f = factorial(k)
  r = trailing_zeroes(k)
  r1 = trailing_zeroes1(k)
  puts "input: #{k}, factorial: #{f}, answer: #{v}, mine: #{r}, mine2: #{r1} -> #{r == v ? "pass" : "fail"}, #{r1 == v ? "pass" : "fail"}"
end
