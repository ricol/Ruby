#!/usr/bin/env ruby

def is_palindrome(x)
	return false if x < 0
	array = []
	r = x
	while r > 0
		d = r % 10
		array << d
		r = r / 10
	end
	for i in 0...array.length
		return false if array[i] != array[array.length - i - 1]
	end
	return true
end

for (i, a) in {121 => true, 1221 => true, 1233 => false, 12 => false, 1 => true, 2 => true, -121 => false}
	r = is_palindrome(i)
	puts "input: #{i}, expect: #{a}, actual: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
