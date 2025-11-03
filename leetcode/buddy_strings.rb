#!/usr/bin/env ruby

# @param {String} s
# @param {String} goal
# @return {Boolean}
def buddy_strings(s, goal)
	return false if s.length != goal.length
	if s == goal
		symmemtric = true
		for i in 0...s.chars.count
			if s.chars[i] != s.chars[s.chars.count - 1 - i]
				symmemtric = false
				break
			end
		end
		return symmemtric
	end
	i, j = 0, 0
	while s.chars[i] == goal.chars[j] && i < s.chars.count && j < goal.chars.count
		i += 1
		j += 1
	end
	m, n = i + 1, j + 1
	while s.chars[m] == goal.chars[n] && m < s.chars.count && n < goal.chars.count
		m += 1
		n += 1
	end
	return true if i >= s.chars.count && j >= goal.chars.count && s != goal
	ss = s.chars
	ss[i], ss[m] = ss[m], ss[i]
	
  return ss.join == goal 
end

for i, r in {
	["ab", "ba"] => true, 
	["ab", "ab"] => false, 
	["abc", "abc"] => false, 
	["aa", "aa"] => true, 
	["aaaa", "aaaa"] => true, 
	["abccba", "abccba"] => true, 
	["abcdefg", "afcdebg"] => true,
	["abab", "abab"] => true}
	a = buddy_strings(i.first, i.last)
	puts "input: #{i}, expect: #{r}, actual: #{a} -> #{a == r ? 'pass' : 'fail'}"
end

__END__
abcdefg, abdcefga

abccba, abccba

abcdefg afcdebg
