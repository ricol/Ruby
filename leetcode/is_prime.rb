#!/usr/bin/env ruby

def is_prime(n)
	s = n / 2
	(2..s).each do |x|
		return false if n % x == 0
	end
	return true
end

(2..100).each do |x|
	print "#{x}\t" if is_prime(x)
end
puts
