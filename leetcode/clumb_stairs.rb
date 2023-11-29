#!/usr/bin/env ruby

$hash = {}

def steps(n)
  return 0 if n == 0
  return 1 if n == 1
  return 2 if n == 2

  return $hash[n] if !$hash[n].nil?

  v1 = steps(n - 1)
  v2 = steps(n - 2)
  $hash[n] = v1 + v2

  return v1 + v2
end

for k, v in { 2 => 2, 3 => 3, 4 => 5, 5 => 8, 6 => 13, 45 => 1836311903 }
  r = steps(k)
  puts "input: #{k}, result: #{v}, my result: #{r}, -> #{r == v ? "pass" : "fail"}"
end

for data in [[2, 2], [3, 3], [4, 5], [5, 8], [6, 13], [45, 1836311903]]
  input, result = data
  r = steps(input)
  puts "input: #{input}, result: #{result}, r: #{r} -> #{result == r ? "pass" : "fail"}"
end
