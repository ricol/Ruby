#!/usr/bin/env ruby

# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
  longest = []
  size = 0
  str = []
  hash = {}
  for i in 0...s.length
    str = [s[i]]
    size = str.length
    hash = { s[i] => true }
    for j in (i + 1)...s.length
      if hash[s[j]].nil?
        str << s[j]
        size = str.length
        hash[s[j]] = true
      else
        break
      end
    end
    longest = str if str.length > longest.length
    break if longest.length >= s.length - i + 1
  end
  return longest.join
end

for input, result in { "abcabcbb" => "abc", "bbbbb" => "b", "pwwkew" => "wke" }
  myresult = length_of_longest_substring(input)
  puts "input: #{input}, my result: #{myresult}, result: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
