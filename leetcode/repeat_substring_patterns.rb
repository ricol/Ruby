#!/usr/bin/env ruby

# @param {String} s
# @return {Boolean}
def repeated_substring_pattern(s)
  return false if s.length == 1
  for i in 1..s.length / 2
    return true if s.length % i == 0 and s == s[0, i] * (s.length / i)
  end
  return false
end

for i, r in { "abab" => true, "aba" => false, "abcabcabcabc" => true, "a" => false }
  my = repeated_substring_pattern(i)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{r == my ? "pass" : "fail"}"
end
