#!/usr/bin/env ruby

def move_zeroes(nums)
  count = 0
  current = 0
  i = 0
  while i < nums.count
    if nums[i] != 0
      nums[current] = nums[i]
      current += 1
    else
      count += 1
    end
    i += 1
  end
  while current < nums.count
    nums[current] = 0
    current += 1
  end
end

for data, result in { [0, 1, 0, 3, 12] => [1, 3, 12, 0, 0], [0] => [0] }
  original = data.dup
  move_zeroes(data)
  puts "input: #{original}, result: #{result}, actual: #{data} -> #{result == data ? "pass" : "fail"}"
end
