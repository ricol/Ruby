#!/usr/bin/env ruby

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_subsequence(s, t)
  j = 0
  for i in 0...s.size
    c = s[i]
    j += 1 while j < t.size and t[j] != c
    return false if j >= t.size
    j += 1
  end
  return true
end

for i, r in { ["abc", "ahbgdc"] => true, ["axc", "ahbgdc"] => false, ["aaaaaa", "bbaaaa"] => false }
  myresult = is_subsequence(i.first, i.last)
  puts "input: #{i}, my result: #{myresult}, correct result: #{r} -> #{myresult == r ? "pass" : "fail"}"
end
