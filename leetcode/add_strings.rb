#!/usr/bin/env ruby

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  mapping = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }
  mappingToChar = { 0 => "0", 1 => "1", 2 => "2", 3 => "3", 4 => "4", 5 => "5", 6 => "6", 7 => "7", 8 => "8", 9 => "9" }
  result = []
  extra = 0
  s = 0
  i = num1.size - 1
  j = num2.size - 1
  while i >= 0 && j >= 0
    s = mapping[num1[i]] + mapping[num2[j]]
    result << mappingToChar[extra != 0 ? (s + extra) % 10 : s % 10]
    extra = (s + extra) / 10
    i -= 1
    j -= 1
  end
  while i >= 0
    s = mapping[num1[i]]
    result << mappingToChar[extra != 0 ? (s + extra) % 10 : s % 10]
    extra = (s + extra) / 10
    i -= 1
  end
  while j >= 0
    s = mapping[num2[j]]
    result << mappingToChar[extra != 0 ? (s + extra) % 10 : s % 10]
    extra = (s + extra) / 10
    j -= 1
  end
  result << mappingToChar[extra] if extra != 0
  return result.reverse.join
end

for i, r in { ["11", "123"] => "134", ["456", "77"] => "533", ["0", "0"] => "0", ["9", "99"] => "108" }
  a = add_strings(i.first, i.last)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} => #{r == a ? "pass" : "fail"}"
end
