#!/usr/bin/env ruby

# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  max = nil
  data = []
  i = 0
  while i < nums.count
    while data.count < k
      data << nums[i]
      i += 1
    end
    s = data.sum * 1.0 / data.count
    max = s if !max || s > max
    data.delete_at(0)
  end
  max
end

def find_max_average1(nums, k)
  max = nil
  i = 0
  s = 0
  count = 0
  while i < nums.count
    while count < k
      s += nums[i]
      i += 1
      count += 1
    end
    a = s * 1.0 / count
    max = a if !max || a > max
    count -= 1
    s -= nums[i - k]
  end
  max
end

for i, r in {[[1,12,-5,-6,50,3], 4] => 12.75000,
[[5], 1] => 5}
  a = find_max_average1(i.first, i.last)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
