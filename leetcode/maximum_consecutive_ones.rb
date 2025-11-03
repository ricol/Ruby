#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def find_max_consecutive_ones(nums)
  result = 0
  flag = 0
  count = 0
  nums.each do |n|
    if n == 1
      count = 0 if flag == 0
      flag = 1
      count += 1
    else
      result = result < count ? count : result if flag == 1
      flag = 0
    end
  end
  result = result < count ? count : result
  return result
end

for i, r in {[1,1,0,1,1,1] => 3, [1,0,1,1,0,1] => 2, [1, 1, 1, 1] => 4}
  a = find_max_consecutive_ones(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
