#!/usr/bin/env ruby

def find_median_sorted_arrays(nums1, nums2)
  nums = []
  i, j, k = 0, 0, 0
  while i < nums1.count && j < nums2.count
    if nums1[i] > nums2[j]
      nums << nums2[j]
      j += 1
    elsif nums1[i] < nums2[j]
      nums << nums1[i]
      i += 1
    else
      nums << nums1[i]
      nums << nums2[j]
      i += 1
      j += 1
      k += 1
    end
    k += 1
  end
  while i < nums1.count
    nums << nums1[i]
    i += 1
    k += 1
  end
  while j < nums2.count
    nums << nums2[j]
    j += 1
    k += 1
  end
  if k % 2 == 0
    return (nums[k / 2 - 1] + nums[k / 2]) / 2.0
  else
    return nums[k / 2]
  end
end

for (i, j, r) in [[[1, 3], [2], 2], [[1, 2], [3, 4], 2.5], [[2, 2, 4, 4], [2, 2, 4, 4], 3]]
  a = find_median_sorted_arrays(i, j)
  puts "input: #{i}, #{j}, expect: #{r}, output: #{a} -> #{a == r ? "pass" : "fail"}"
end
