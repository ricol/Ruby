#!/usr/bin/env ruby

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
  result = Array.new(nums1.count, -1)
  hash = {}
  for j in 0...nums2.count
    hash[nums2[j]] = j
  end
  for i in 0...nums1.count
    for j in hash[nums1[i]]...nums2.count
      if nums2[j] > nums1[i]
        result[i] = nums2[j]
        break
      end
    end
  end
  return result
end

for i, r in {[[4,1,2], [1,3,4,2]] => [-1,3,-1], [[2,4], [1, 2, 3, 4]] => [3,-1]}
  a = next_greater_element(i.first, i.last)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
