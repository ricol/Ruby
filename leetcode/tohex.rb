#!/usr/bin/env ruby

# @param {Integer} num
# @return {String}
def to_hex(num)
  return "0" if num == 0
  result = []
  hex = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
  while num > 0
    m = num / 16
    r = num % 16
    result << hex[r]
    num = num >> 4
  end
  return result.reverse.join
end

total = 0
success = 0
failed = 0
(0..100000).step(1000).each do |r|
  m = to_hex(r)
  correct = sprintf("%x", r)
  bPass = m == correct
  bPass ? success += 1 : failed += 1
  total += 1
  puts "input: #{r}, correct result: #{correct}, my result: #{m} -> #{bPass ? "pass" : "fail"}"
end
puts "total: #{total}, success: #{success}, failed: #{failed}"
