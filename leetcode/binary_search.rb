#!/usr/bin/env ruby

def search(nums, target)
  l = 0
  r = nums.count - 1
  m = (l + r) / 2
  while l <= r
    if nums[m] == target
      return m
    elsif nums[m] < target
      l = m + 1
    else
      r = m - 1
    end
    m = (l + r) / 2
  end
  return -1
end

def search_insert(nums, target)
  for i in (0...nums.count).to_a
    if nums[i] == target
      return i
    elsif nums[i] < target
      next
    else
      return i
    end
  end
  return nums.count
end

for data, actual in { [[-1, 0, 3, 5, 9, 12], 2] => -1, [[5], 5] => 0 }
  array, target = data
  result = search(array, target)
  puts "input: #{array}, #{target}, result: #{result}, actual: #{actual} -> #{result == actual ? "pass" : "fail"}"
end

for data, actual in { [[1, 3, 5, 6], 5] => 2, [[1, 3, 5, 6], 0] => 0, [[1, 3], 2] => 1, [[1, 3, 5, 6], 7] => 4 }
  array, target = data
  result = search_insert(array, target)
  puts "input: #{array}, #{target}, result: #{result}, actual: #{actual} -> #{result == actual ? "pass" : "fail"}"
end
