#!/usr/bin/env ruby

# @param {Integer[]} prices
# @return {Integer}
def max_profit(prices)
  min = 1e10
  max_p = 0
  prices.each do |p|
    max_p = p - min if p - min > max_p
    min = p if p < min
  end
  return max_p
end

for k, v in { [7, 1, 5, 3, 6, 4] => 5, [7, 6, 4, 3, 1] => 0, [7, 2, 9, 1, 3] => 7 }
  r = max_profit(k)
  puts "input: #{k}, answer: #{v}, mine: #{r} -> #{v == r ? "pass" : "fail"}"
end
