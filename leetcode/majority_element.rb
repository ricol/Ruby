#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def majority_element(nums)
  hash = {}
  max = 0
  r = 0
  for n in nums
    hash[n] = hash[n].nil? ? 1 : hash[n] + 1
    r, max = n, hash[n] if hash[n] > max
  end
  return r
end

for k, v in { [3, 2, 3] => 3, [2, 2, 1, 1, 1, 2, 2] => 2 }
  r = majority_element(k)
  puts "input: #{k}, answer: #{v}, mine: #{r} -> #{r == v ? "pass" : "fail"}"
end
