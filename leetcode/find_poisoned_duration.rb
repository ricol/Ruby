#!/usr/bin/env ruby

# @param {Integer[]} time_series
# @param {Integer} duration
# @return {Integer}
def find_poisoned_duration(time_series, duration)
  previous = -1
  total = 0
  time_series.each do |t|
    total -= previous + duration - t if previous > -1 && t < previous + duration
    total += duration
    previous = t
  end
  return total
end

for i, r in {[[1, 4], 2] => 4, [[1, 2], 2] => 3, [[0, 3, 6, 9], 5] => 14}
  a = find_poisoned_duration(i.first, i.last)
  puts "input: #{i}, expected: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
