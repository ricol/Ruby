#!/usr/bin/env ruby

# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
  target = area / 2 + 1
  i = 1
  hash = {}
  result = []
  diff = area
  while i <= target
    j = area / i
    k = i
    i += 1
    next if k * j != area
    next if hash[k] || hash[j]
    d = (k - j).abs
    if d < diff
      diff = d
      result = k > j ? [k, j] : [j, k]
    end
    hash[k] = true
    hash[j] = true
  end
  return result
end

for i, r in {4 => [2, 2], 37 => [37, 1], 122122 => [427, 286], 1 => [1, 1], 9999911 => [32573, 307]}
  a = construct_rectangle(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
