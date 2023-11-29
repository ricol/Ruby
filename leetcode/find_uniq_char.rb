#!/usr/bin/env ruby

# @param {String} s
# @return {Integer}
def find_uniq_char(s)
  hash = {}
  char = {}
  s.chars.each_with_index do |x, index|
    hash[x] = hash[x].nil? ? 1 : hash[x] + 1
    char[x] = index if char[x].nil?
  end
  hash.each_pair do |c, num|
    return char[c] if num == 1
  end
  return -1
end

for i, r in { "leetcode" => 0, "loveleetcode" => 2, "aabb" => -1 }
  myresult = find_uniq_char(i)
  puts "input: #{i}, myresult: #{myresult}, correct result: #{r} -> #{myresult == r ? "pass" : "fail"}"
end
