#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
  max = nil
  nums.each_with_index do |x, a|
    nums.each_with_index do |y, b|
      nums.each_with_index do |z, c|
        if a != b && a != c && b != c
          p = x * y * z
          max = p if !max || p > max
        end
      end
    end
  end
  max
end

def maximum_product1(nums)
  nums.sort!
  final_set= nums[nums.size-3..-1]
  answer = final_set[0] * final_set[1] * final_set[2]
  if nums[0] < 0 and nums[1] < 0
      answer = [answer, (nums[0] * nums[1] * nums[-1])].max
  end
  answer
end

for i, r in {
  [1,2,3] => 6,
  [1,2,3,4] => 24, 
  [-1,-2,-3] => -6, 
  [-100,-98,-1,2,3,4] => 39200,
  [1, 0, 100] => 0,
  [-1,-2,-3,-4] => -6}
  a = maximum_product1(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
