#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def find_lhs(nums)
  hash = {}
  data = []
  maxlen = 0
  for i in 0...nums.count
    next if hash[nums[i]]
    break if nums.count - i <= maxlen
    a = nil
    b = nil
    data = []
    for j in 0...nums.count
      if !a && !b
        if (nums[i] - nums[j]).abs == 1
          a = nums[i]
          b = nums[j]
          data << nums[j]
        elsif nums[i] == nums[j]
          data << nums[j]
        end
      else
        data << nums[j] if nums[j] == a || nums[j] == b
      end
    end
    data = [] if a == b
    hash[nums[i]] = data.size
    if data.size > maxlen
      maxlen = data.size 
    end
  end
  maxlen
end

def find_lhs1(nums)
  max = 0
  h = {}
  nums.each do |x|
      h[x] = 0 if !h[x]
      h[x] += 1
      if h[x-1]
          tmp = h[x] + h[x-1]
          max = tmp if tmp > max
      end
      if h[x+1]
          tmp = h[x] + h[x+1]
          max = tmp if tmp > max
      end
  end
  max
end

for i, r in {
  [1,3,2,2,5,2,3,7] => 5, 
  [1,2,3,4] => 2, 
  [1,1,1,1] => 0,
  [1,3,5,7,9,11,13,15,17] => 0,
  [-3,-1,-1,-1,-3,-2] => 4,
  [1,2,1,3,0,0,2,2,1,3,3] => 6,
  [2,2,2,2,2,2,2,3,1,0,0,0,3,1,-1,0,1,1,0,0,1,1,2,2,2,0,1,2,2,3,2] => 20,
  [0,7,9,9,3,5,4,3,2,3,3,9,0,4,5,1,0,10,5,5,4,9,-5,2,6,5,9,5,1,6,6,7,
  9,5,2,1,0,7,2,9,7,4,7,9,3,6,9,2,10,9,1,7,8,8,8,7,4,2,7,9,-4,3,0,6,
  3,8,3,0,9,4,6,10,1,6,10,0,2,3,2,7,9,8] => 18}
  a = find_lhs(i)
  b = find_lhs1(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}; others: #{b} -> #{b == r ? 'pass' : 'fail'}"
end
