#!/usr/bin/env ruby

def longest_palindrome(s)
	i = 0
	j = s.chars.length - 1
	ii = i
	jj = j
	while ii != jj
		if s.chars[ii]		
	end
end

for (i, v) in {"babad" => "bab", "cbbd" => "bb"}
	r = longest_palindrome(i)
	puts("input: #{i}, expect: #{v}, actual: #{r}")
end
