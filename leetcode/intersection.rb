#!/usr/bin/env ruby

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}

require "set"

def intersection(nums1, nums2)
  long, short = nums1, nums2
  long, short = short, long if nums2.count > nums1.count
  hash = {}
  long.each do |x|
    hash[x] = false
  end
  short.each do |x|
    hash[x] = true if !hash[x].nil?
  end
  result = {}
  hash.each_pair do |x, value|
    result[x] = true if value
  end
  return result.keys
end

for i, r in { [[1, 2, 2, 1], [2, 2]] => [2], [[4, 9, 5], [9, 4, 9, 8, 4]] => [9, 4] }
  my = intersection(i.first, i.last)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{Set[my] == Set[r] ? "pass" : "fail"}"
end
