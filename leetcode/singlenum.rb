#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}

def single_number(nums)
  sum = 0
  flag = true
  nums.each do |x|
    flag ? sum += x : sum -= x
    flag = !flag
  end

  return sum
end

for k, v in { [2, 2, 1] => 1, [4, 1, 2, 1, 2] => 4, [1] => 1 }
  s = single_number(k)
  puts "#{k}, answer: #{v}, my answer: #{s} -> #{v == s ? "pass" : "fail"}"
end
