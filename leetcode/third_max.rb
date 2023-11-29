#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {Integer}
def third_max(nums)
  first = nil
  second = nil
  third = nil
  nums.each do |x|
    if !first
      third = second
      second = first
      first = x
    else
      if x > first
        third = second
        second = first
        first = x
      elsif (second and x > second and x != first) or (!second and x != first)
        third = second
        second = x
      elsif (third and x > third and x != second and x != first) or (!third and x != second and x != first)
        third = x
      end
    end
  end
  return third ? third : first
end

for i, r in {[3,2,1] => 1, [1,2] => 2, [2, 2, 3, 1] => 1, [1,2,2] => 2, [1,2,2,5,3,5] => 2}
  a = third_max(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{a == r ? 'pass' : 'fail'}"
end
