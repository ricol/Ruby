#!/usr/bin/env ruby

def is_match(s, p)
  previous = nil
  i = 0
  j = 0
  while i < s.length and j < p.length
    pp = p[j]
    c = s[i]
    # puts "pp: #{pp}, c: #{c}"
    if pp == "."
      i += 1
      j += 1
    elsif pp == "*"
      if previous != "." and previous != "*" and c == previous
        i += 1
      else
        return false
      end
    else
      if pp == c
        i += 1
        j += 1
      else
        return false
      end
    end
    previous = c
  end
  return ((i <= s.length) and ((j == p.length) or (j == p.length - 1)))
end

for (i, a) in { ["aa", "a."] => true, ["aa", "a*"] => true, ["aabaa", "a.ba*"] => true, ["aa", "a"] => false, ["ab", ".*"] => true }
  r = is_match(i.first, i.last)
  puts "input: #{i}, expect: #{a}, actual: #{r} -> #{a == r ? "pass" : "fail"}"
end
