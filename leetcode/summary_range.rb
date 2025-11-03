#!/usr/bin/env ruby

# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  ranges = []
  previous = nil
  range = []
  nums.each do |x|
    if previous == nil
      range = [x]
    else
      if previous + 1 == x
        range.delete_at(range.count - 1) if range.count > 1
        range << x
      else
        ranges << range.join("->") if range != []
        range = [x]
      end
    end
    previous = x
  end
  ranges << range.join("->") if range != []
  return ranges
end

for k, r in { [0, 1, 2, 4, 5, 7] => ["0->2", "4->5", "7"], [0, 2, 3, 4, 6, 8, 9] => ["0", "2->4", "6", "8->9"] }
  myresult = summary_ranges(k)
  puts "input: #{k}, correct result: #{r}, my result: #{myresult} -> #{r == myresult ? "pass" : "fail"}"
end
