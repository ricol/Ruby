#!/usr/bin/env ruby

# @param {Character[]} s
# @return {Void} Do not return anything, modify s in-place instead.
def reverse_string(s)
  t = ""
  for i in 0...(s.count / 2)
    t = s[i]
    s[i] = s[s.count - i - 1]
    s[s.count - i - 1] = t
  end
end

for data, result in { ["h", "e", "l", "l", "o"] => ["o", "l", "l", "e", "h"], ["H", "a", "n", "n", "a", "h"] => ["h", "a", "n", "n", "a", "H"] }
  input = data.dup
  reverse_string(data)
  puts "input: #{input}, my result: #{data}, result: #{result} -> #{data == result ? "pass" : "fail"}"
end
