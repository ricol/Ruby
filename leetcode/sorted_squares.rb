#!/usr/bin/env ruby

def sorted_squares(nums)
  l = 0
  r = nums.count - 1
  data = []
  s1 = 0
  s2 = 0
  while l < nums.count && r >= 0 && l < r
    s1 = nums[l] * nums[l]
    s2 = nums[r] * nums[r]
    if s2 > s1
      data << s2
      r -= 1
    elsif s2 < s1
      data << s1
      l += 1
    else
      data << s1
      data << s2
      r -= 1
      l += 1
    end
  end
  data << nums[l] * nums[l] if l == r
  return data.reverse
end

for data, result in { [-4, -1, 0, 3, 10] => [0, 1, 9, 16, 100], [-7, -3, 2, 3, 11] => [4, 9, 9, 49, 121], [-10000, -9999, -7, -5, 0, 0, 10000] => [0, 0, 25, 49, 99980001, 100000000, 100000000] }
  myresult = sorted_squares(data)
  puts "input: #{data}, my result: #{myresult}, actual: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
