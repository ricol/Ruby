#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def has_alternating_bits(n)
  r = n
  bit = -1
  while r >= 1
  	b = r % 2
    return false if b == bit
    bit = b
    r = r / 2
  end
  true
end

for i, r in {5 => true, 7 => false, 11 => false, 3 => false}
  a = has_alternating_bits(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
