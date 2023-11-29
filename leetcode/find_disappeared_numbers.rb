#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer[]}
def find_disappeared_numbers(nums)
  result = []
  all_nums = {}
  nums.count.times do |x|
    all_nums[x + 1] = false
  end
  for i in 0...nums.count
    n = nums[i]
    all_nums[n] = true if !all_nums[n]
  end
  all_nums.each { |k, v|
    result << k if v == false
  }
  return result
end

for i, r in {[4,3,2,7,8,2,3,1] => [5, 6], [1, 1] => [2]}
  a = find_disappeared_numbers(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
