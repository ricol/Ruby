#!/usr/local/bin/ruby

def factorial(n)
  return 1 if n <= 1
  return factorial(n - 1) * n
end

def fun(n)
	return n ** (1.0 / n)
end

num = ARGV[0].to_i
puts "Calculating e..."
puts "num = #{num}"
STDOUT::flush
e = 0
(0..num).each do |n|
  e += 1.0 / factorial(n)
end
puts "result: #{e}"

(1..num).each do |n|
	puts "#{n} -> e: #{fun(n)}"
end
