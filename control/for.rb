#!/usr/bin/env ruby

nums = []
MAX = 10
(0..MAX).each do |t| nums << rand(MAX) end
for n in nums
  puts n
end

nameMappings = { 'ricol': 34, 'qianchunyan': 32, 'wangjing': 34 }
for name, age in nameMappings
  puts "name: #{name}, age: #{age}"
end

for i in (0..10)
  puts i
end

for i in (0...10)
  puts i
end

(0..10).each do |i| puts i end
(0...10).each do |i| puts i end
