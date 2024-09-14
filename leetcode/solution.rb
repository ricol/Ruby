#!/usr/bin/env ruby

# you can write to stdout for debugging purposes, e.g.
# puts "this is a debug message"

def solution(a)
  nums = {}
  hash = {}
  for num in a 
    hash[num + 1] = true if !hash[num + 1] && num + 1 > 0 && !nums[num + 1]
    hash.delete(num) if hash[num] || nums[num]
    nums[num] = true
  end
  value = nil
  for k in hash.keys || []
    value = k if !value || k < value
  end
  value || 1
end

for i, r in {[1, 3, 6, 4, 1, 2] => 5, [1, 2, 3] => 4, [-1, -3] => 1}
  a = solution(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
