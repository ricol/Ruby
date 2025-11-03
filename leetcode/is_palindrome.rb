#!/usr/bin/env ruby

# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  data = []
  s.chars.each do |x| data << x.downcase if ("a".."z").include?(x) or ("A".."Z").include?(x) or ("0".."9").include?(x) end
  index = (data.count - 1) / 2
  for i in (0..index)
    return false if data[i] != data[data.count - 1 - i]
  end
  return true
end

for k, v in { "A man, a plan, a canal: Panama" => true, "race a car" => false }
  r = is_palindrome(k)
  puts "input: \"#{k}\", answer: #{v}, my answer: #{r} -> #{v == r ? "pass" : "fail"}"
end
