#!/usr/bin/env ruby

# @param {Integer} area
# @return {Integer[]}
def construct_rectangle1(area)
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

# @param {Integer} area
# @return {Integer[]}
def construct_rectangle2(area)
  data = []
  m = (area ** 0.5).to_i
  for i in 1..m
    data << area / i if area % i == 0
  end
  min = area
  result = []
  puts "data.size: #{data.count}"
  for x in data 
    y = area / x
    if (y - x).abs < min
      min = (y - x).abs 
      result = y > x ? [y, x] : [x, y]
    end
  end
  result == [] ? [1, 1] : result
end

# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
  w = Integer.sqrt(area)
  while (area % w) != 0
    w -= 1
  end
  [area/w, w]
end

for i, r in {4 => [2, 2], 37 => [37, 1], 122122 => [427, 286], 1 => [1, 1], 9999911 => [32573, 307]}
  a = construct_rectangle(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
