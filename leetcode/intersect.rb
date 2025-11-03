#!/usr/bin/env ruby

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

def intersect(nums1, nums2)
  long, short = nums1, nums2
  long, short = short, long if nums1.size < nums2.size
  data = []
  hash = {}
  long.each do |x|
    hash[x] = hash[x].nil? ? 1 : 1 + hash[x]
  end
  short.each do |x|
    if hash[x] and hash[x] > 0
      hash[x] -= 1
      data << x
    end
  end
  return data
end

for i, r in { [[1, 2, 2, 1], [2, 2]] => [2, 2], [[4, 9, 5], [9, 4, 9, 8, 4]] => [4, 9] }
  m = intersect(i.first, i.last)
  puts "input: #{i}, my result: #{m}, correc result: #{r} -> #{m == r ? "pass" : "fail"}"
end
