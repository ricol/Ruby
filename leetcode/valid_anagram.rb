#!/usr/bin/env ruby

# @param {String} s
# @param {String} t
# @return {Boolean}
def is_anagram(s, t)
  return false if s.chars.count != t.chars.count
  hash = {}
  s.chars.each do |c|
    if hash[c].nil?
      hash[c] = 1
    else
      hash[c] += 1
    end
  end
  t.chars.each do |c|
    return false if hash[c].nil?
    return 0 if hash[c] == 0
    hash[c] -= 1
  end
  #actually no need to check this
  for k, v in hash
    return false if hash[k] != 0
  end
  return true
end

for data, result in { ["anagram", "nagaram"] => true, ["rat", "car"] => false }
  myresult = is_anagram(data.first, data.last)
  puts "input, #{data}, my result: #{myresult}, result: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
