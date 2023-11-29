#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def is_power_of_three(n)
  # return false if n <= 0
  # return true if n == 1
  m = 0
  while n > 0
    m = n % 3
    n = n / 3
    return false if m != 0 && n > 0
  end
  return m == 1
end

num = 3
(0..10).each do |x|
  r = num ** x
  puts "#{num}**#{x} -> #{r}, #{r.to_s(2)}, #{r.to_s(16)}, #{r.to_s(3)}"
end

for i, r in { 1 => true, 5 => false, 9 => true, 26 => false, 27 => true, 45 => false, 81 => true }
  result = is_power_of_three(i)
  puts "input: #{i}, result: #{result} -> #{result == r ? "pass" : "fail"}"
end
