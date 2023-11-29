#!/usr/bin/env ruby

# @param {String} s
# @param {String} t
# @return {Character}
def find_the_difference(s, t)
  value1 = 0
  value2 = 0
  s.chars.each do |c|
    value1 += c.bytes.first
  end
  t.chars.each do |c|
    value2 += c.bytes.first
  end
  return (value2 - value1).chr
end

for i, r in { ["abcd", "abedc"] => "e", ["axc", "acxb"] => "b", ["aaaaaa", "aabaaaa"] => "b", ["a", "aa"] => "a" }
  myresult = find_the_difference(i.first, i.last)
  puts "input: #{i}, my result: #{myresult}, correct result: #{r} -> #{myresult == r ? "pass" : "fail"}"
end
