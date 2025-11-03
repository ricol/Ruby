#!/usr/bin/env ruby

# @param {Integer[]} numbers
# @param {Integer} target
# @return {Integer[]}
def two_sum(numbers, target)
  hash = {}
  numbers.each_with_index do |n, index|
    return [hash[n] + 1, index + 1] if !hash[n].nil?
    hash[target - n] = index
  end
  return []
end

for k, v in { [[2, 7, 11, 15], 9] => [1, 2], [[2, 3, 4], 6] => [1, 3], [[-1, 0], -1] => [1, 2] }
  numbers, target = k
  r = two_sum(numbers, target)
  puts "array: #{numbers}, target: #{target}, answer: #{v}, mine: #{r} -> #{v == r ? "pass" : "fail"}"
end
