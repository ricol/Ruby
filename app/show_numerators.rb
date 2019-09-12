#!/usr/local/bin/ruby

num = ARGV[0]
if num
  n = num.to_i
  results = []
  (2..n / 2).each do |i|
    results << i if n % i == 0
  end
  if results.count > 0 || n < 2
    puts "total: #{results.count}"
    puts results
  else
    puts "#{n} is prime number."
  end
else
  puts "Usage: show_numerators.rb <num>"
end
