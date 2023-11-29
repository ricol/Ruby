#!/usr/bin/env ruby

# @param {String} ransom_note
# @param {String} magazine
# @return {Boolean}
def can_construct(ransom_note, magazine)
  hash = {}
  magazine.chars.each do |char|
    hash[char] = hash[char].nil? ? 1 : 1 + hash[char]
  end
  ransom_note.chars.each do |c|
    return false if !hash[c] or hash[c] <= 0
    hash[c] = hash[c] - 1
  end
  return true
end

for i, r in { ["a", "a"] => true, ["b", "a"] => false, ["aa", "ab"] => false, ["cc", "abcc"] => true, ["abc", "bcdefa"] => true }
  my = can_construct(i.first, i.last)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{r == my ? "pass" : "fail"}"
end
