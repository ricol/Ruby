#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
  duplicate = nil
  hash = {}
  hashMissing = {}
  nums.each_with_index do |value, index|
    hashMissing[index + 1] = true if !hash[index + 1]
    hashMissing.delete(value)
    hash[value] = hash[value] ? hash[value] + 1 : 1
    duplicate = value if hash[value] && hash[value] > 1
  end
  return [duplicate, hashMissing.keys.first]
end

for i, r in {[1,2,2,4] => [2, 3], [1, 1] => [1, 2], [3, 2, 2] => [2, 1], [3, 3, 1] => [3, 2],
[1,5,3,2,2,7,6,4,8,9] => [2, 10]}
  a = find_error_nums(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{a == r ? 'pass' : 'fail'}"
end
