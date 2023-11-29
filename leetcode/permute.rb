#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer[][]}
def permute(nums)
  first = nums.first
  return [[first]] if nums.count == 1

  rest = nums[1, nums.count]
  others = permute(rest)

  all = []
  for array in others
    for i in 0..array.count
      temp = array.dup
      temp.insert(i, first)
      all << temp
    end
  end
  return all
end

require "set"

for input, result in { [1, 2, 3] => Set.new([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]]), [0, 1] => Set.new([[0, 1], [1, 0]]), [1] => Set.new([[1]]) }
  myresult = permute(input)
  puts "input: #{input}, my result: #{myresult} -> #{Set.new(myresult) == result ? "pass" : "fail"}"
end
