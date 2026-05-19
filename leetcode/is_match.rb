#!/usr/bin/env ruby

def is_match(s, p)
  i = 0
  j = 0
  while i < s.length && j < p.length
    if p[j] == "."
      i += 1
      j += 1
    elsif p[j] == "*"
      if p[j - 1] == "."
        i += 1
      else
        if p[j - 1] == s[i]
          i += 1
        else
          j += 1
        end
      end
    else
      if p[j] == s[i]
        i += 1
        j += 1
      else
        while j + 1 < p.length && p[j + 1] == "*"
          j += 1
        end
      end
    end
  end

  puts "i: #{i}/#{s.length}, j: #{j}/#{p.length}"
  while j < p.length
    if p[j] == "*"
      j += 1
    end
  end
  j += 1 if j < p.length && p[j] == s[i - 1] && p[j - 1] == "*"

  while i < s.length && p[j - 1] == "*" && p[j - 2] == s[i - 1]
    i += 1
  end
  puts "i: #{i}/#{s.length}, j: #{j}/#{p.length}"
  return i >= s.length && j >= p.length
end

for (i, a) in {
                ["aa", "a."] => true,
                ["aaa", "aaaa"] => false,
                ["aaa", "a*a"] => true,
                ["aa", "a*"] => true,
                ["aabaa", "a.ba*"] => true,
                ["aa", "a"] => false,
                ["ab", ".*"] => true,
                ["aab", "c*a*b"] => true,
                ["abcd", "d*"] => false,
                ["aaa", "ab*a*c*a"] => true,
              }
  r = is_match(i.first, i.last)
  puts "input: #{i}, expect: #{a}, actual: #{r} -> #{a == r ? "pass" : "fail"}"
end
