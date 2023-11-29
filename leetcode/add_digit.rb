#!/usr/bin/env ruby

# @param {Integer} num
# @return {Integer}
def add_digits(num)
  return num if num < 10
  sum = 0
  r = num
  while r > 0
    n = r % 10
    sum += n
    r = r / 10
  end
  return sum if sum < 10
  return add_digits(sum)
end

for k, v in { 38 => 2, 2 => 2, 11 => 2, 100 => 1 }
  r = add_digits(k)
  puts "input: #{k}, result: #{v}, my result: #{r}, -> #{r == v ? "pass" : "fail"}"
end
