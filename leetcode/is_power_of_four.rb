#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def is_power_of_four(n)
  m = 0
  while n > 0
    m = n % 4
    n = n / 4
    return false if m != 0 && n > 0
  end
  return m == 1
end

(0..10).each do |x|
  r = 4 ** x
  puts "4**#{x} -> #{r}, #{r.to_s(2)}, #{r.to_s(4)}, #{r.to_s(16)}"
end

for i, r in { 1 => true, 5 => false, 16 => true, 64 => true }
  result = is_power_of_four(i)
  puts "input: #{i}, result: #{result} -> #{result == r ? "pass" : "fail"}"
end
