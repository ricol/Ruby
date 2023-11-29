#!/usr/bin/env ruby

def binary(n)
  b = []
  x = n
  while x > 1
    a = x % 2
    b << a
    x = x >> 1
  end
  b << x
  return b.reverse
end

for k, v in { 1 => [1], 0 => [0], 2 => [1, 0], 3 => [1, 1], 4 => [1, 0, 0], 5 => [1, 0, 1], 6 => [1, 1, 0] }
  r = binary(k)
  puts "input: #{k}, answer: #{v}, mine: #{r} -> #{r == v ? "pass" : "fail"}"
end
