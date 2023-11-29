#!/usr/bin/env ruby

# @param {String} s
# @return {String}
def reverse_vowels(s)
  vowels = ["a", "e", "i", "o", "u"]
  str = s.dup
  i = 0
  j = s.size - 1
  while i < j
    i += 1 while !vowels.include?(str[i].downcase) and i < j
    j -= 1 while !vowels.include?(str[j].downcase) and i < j
    str[i], str[j] = str[j], str[i]
    i += 1
    j -= 1
  end
  return str
end

for i, r in { "hello" => "holle", "leetcode" => "leotcede", "aA" => "Aa" }
  m = reverse_vowels(i)
  puts "input: #{i}, my result: #{m}, correct result: #{r} -> #{m == r ? "pass" : "fail"}"
end
