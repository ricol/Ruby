#!/usr/bin/env ruby

def f(num)
  (1 / Math.sqrt(5)) * (((1 + Math.sqrt(5)) / 2) ** num - ((1 - Math.sqrt(5)) / 2) ** num)
end

def isEqual?(a, b)
  # a == b
  (a - b).abs < 1e-10
end

NUM = 70
result = []
(1..NUM).each do |num|
  result << f(num).to_i
end
puts result
puts "validating..."
succeed = 0
failed = 0
(2...result.count).each do |i|
  isEqual?(result[i - 2] + result[i - 1], result[i]) ? succeed += 1 : failed += 1
end
puts "Result:" + "-" * 20
puts "Succeed: #{succeed}, Failed: #{failed}"
