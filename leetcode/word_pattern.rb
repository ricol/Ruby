#!/usr/bin/env ruby

# @param {String} pattern
# @param {String} s
# @return {Boolean}
def word_pattern(pattern, s)
  result = true
  hash = {}
  hashStr = {}
  i = 0
  j = 0
  k = 0

  for i in 0...pattern.chars.count
    c = pattern.chars[i]
    w = []

    return false if j >= s.chars.count
    for k in j...s.chars.count
      cc = s.chars[k]
      if cc != " "
        w << cc
      else
        break
      end
    end
    ss = w.join
    j = k + 1

    if hashStr[ss].nil?
      hashStr[ss] = c
      if hash[c].nil?
        hash[c] = ss
      elsif hash[c] != ss
        result = false
        break
      end
    elsif hashStr[ss] != c
      result = false
      break
    end
  end
  result = false if i != pattern.chars.count - 1 || j != s.chars.count
  result
end

for i, r in { ["he", "unit"] => false, ["aaaa", "abc abc abc"] => false, ["aaa", "abc abc abc abc"] => false, ["abba", "dog cat cat dog"] => true, ["abba", "dog cat cat fish"] => false, ["aaaa", "dog cat cat dog"] => false, ["abba", "dog dog dog dog"] => false }
  result = word_pattern(i.first, i.last)
  puts "input: #{i}, result: #{result} -> #{result == r ? "pass" : "fail"}"
end
