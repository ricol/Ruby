#!/usr/bin/env ruby

# @param {Integer} num
# @return {String}
def convert_to_base7(num)
  result = []
  negative = num < 0
  num = -num if negative
  while num >= 7
    r = num % 7
    num = num / 7
    result << r
  end
  result << num
  return negative ? "-" + result.reverse.join : result.reverse.join
end

for i, r in {100 => "202", -7 => "-10", -8 => "-11"}
  result = convert_to_base7(i)
  puts "input: #{i}, expected: #{r}, actual: #{result} -> #{result == r ? 'pass' : 'fail'}"
end
