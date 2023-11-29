#!/usr/bin/env ruby

if ARGV.size < 1
	puts "Usage: prime.rb <num>"
	exit
end

def is_prime(num)
	(2..num / 2).each do |x|
		return false if num % x == 0
	end
	return true
end

(2..ARGV.last.to_i).each do |x|
	print("#{x}\t") if is_prime(x)
end

print("\n")
