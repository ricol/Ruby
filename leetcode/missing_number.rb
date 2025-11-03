#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  hash = {}
  nums.each do |x|
    hash[x] = 1 if hash[x].nil?
  end
  n = hash.keys.count
  (0..n).each do |x|
    return x if hash[x].nil?
  end
  return nil
end

for k, v in { [3, 0, 1] => 2, [0, 1] => 2, [9, 6, 4, 2, 3, 5, 7, 0, 1] => 8 }
  r = missing_number(k)
  puts "input: #{k}, result: #{v}, my result: #{r}, -> #{r == v ? "pass" : "fail"}"
end
