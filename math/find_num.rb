#!/usr/bin/env ruby

num = ARGV[0] != nil ? ARGV[0].to_i : 100
puts "Searching from 1 to #{num}..."
total = yes = no = 0
(1..num).each do |n|
  nums = []
  (1..(n / 2)).each do |x| nums << x if n % x == 0 end
  sum = 0
  nums.each do |n| sum += n end
  total += 1
  if sum == n
    print("Find num #{n}... #{nums} -> sum: #{sum}\n")
    yes += 1
  else
    no += 1
  end
end

puts "Find: #{yes}"
puts "Total: #{total}"
