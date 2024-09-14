#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def find_length_of_lcis(nums)
  i = 0
  j = 1
  max = 0
  while j < nums.count
    if !(nums[j] > nums[j - 1])
      max = j - i > max ? j - i : max
      i = j
    end
    j += 1
  end
  return j - i > max ? j - i : max
end

for i, r in {[1,3,5,4,7] => 3, [2, 2, 2, 2] => 1, [1, 3, 5, 7] => 4}
  a = find_length_of_lcis(i)
  puts "input: #{i}, expect: #{r}, actaul: #{a} -> #{r == a ? 'pass' : 'fail'}"
end