#!/usr/bin/env ruby

# @param {Integer} n
# @return {Integer[]}
def count_bits(n)
  result = [1]
  while n / 2 > 0
	result << n % 2
	n /= 2
  end
  return result
end

for i, r in { 1 => [0, 1], 2 => [0, 1, 1], 3 => [0, 1, 1, 2], 4 => [0, 1, 1, 2, 1], 5 => [0, 1, 1, 2, 1, 2] }
  result = count_bits(i)
  puts "input: #{i}, result: #{result} -> #{result == r ? "pass" : "fail"}"
end

for i in 0..20
  b = i.to_s(2)
  n = b.chars.filter { |x|
    x == "1"
  }.count
  printf("%d -> %s -> %d\n", i, b, n)
end
