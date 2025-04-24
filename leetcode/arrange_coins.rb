#!/usr/bin/env ruby

# @param {Integer} n
# @return {Integer}
def arrange_coins(n)
  sum = 0
  i = 1
  while sum < n
    sum += i
    i += 1
  end
  return sum == n ? i - 1 : i - 2
end

for i, r in { 5 => 2, 8 => 3 }
  a = arrange_coins(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{a == r ? "pass" : "fail"}"
end
