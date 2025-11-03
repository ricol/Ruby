#!/usr/bin/env ruby

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_isomorphic(s, t)
  return false if s.length != t.length
  hash1 = {}
  hash2 = {}
  for i in 0...s.length
    c1 = s[i]
    c2 = t[i]
    hash1[c1] = i if hash1[c1].nil?
    hash2[c2] = i if hash2[c2].nil?
    return false if hash1[c1] != hash2[c2]
  end
  return true
end

for data, result in { ["egg", "add"] => true, ["foo", "bar"] => false, ["paper", "title"] => true, ["bbbaaaba", "aaabbbba"] => false }
  myresult = is_isomorphic(data.first, data.last)
  puts "input: #{data}, my result: #{myresult}, result: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
