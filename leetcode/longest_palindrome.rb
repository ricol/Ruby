#!/usr/bin/env ruby

def longest_palindrome(s)
	''
end

for i, r in {"babad" => "bab", "cbbd" => "bb"}
	a = longest_palindrome(i)
	puts "input: #{i}, expect: #{r}, actual: #{a} => #{r == a ? 'pass' : 'fail'}"
end
