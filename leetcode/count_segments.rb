#!/usr/bin/env ruby

# @param {String} s
# @return {Integer}
def count_segments(s)
  flag = true
  result = 0
  i = 0
  while i < s.size
    if s[i] == " "
      result += 1 if !flag
      flag = true
    else
      flag = false
    end
    i += 1
  end
  result += 1 if !flag
  return result
end

for i, r in {"Hello, my name is John" => 5, "hello" => 1, "welcome ricol wang" => 3, "love live! mu'sic forever" => 4}
  a = count_segments(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} => #{r == a ? 'pass' : 'fail'}"
end
