#!/usr/bin/env ruby

def rotate(nums, k)
  t = 0
  while k > 0
    t = nums[nums.count - 1]
    for i in 0...nums.count - 1
      nums[nums.count - 1 - i] = nums[nums.count - 1 - i - 1]
    end
    nums[0] = t
    k -= 1
  end
end

def rotate1(nums, k)
  copy = nums.dup
  size = copy.count
  for i in 0...size
    nums[(i + k) % size] = copy[i]
  end
end

for data, result in { [[1, 2, 3, 4, 5, 6, 7], 3] => [5, 6, 7, 1, 2, 3, 4], [[-1, -100, 3, 9], 2] => [3, 9, -1, -100], [[-1], 2] => [-1], [[1, 2], 3] => [2, 1] }
  array = data.first.dup
  rotate1(data.first, data.last)
  puts "input: #{array}, #{data.last}, my result: #{data.first}, correct result: #{result} -> #{data.first == result ? "pass" : "fail"}"
end
