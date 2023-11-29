#!/usr/bin/env ruby

# @param {String} num1
# @param {String} num2
# @return {String}
def add_strings(num1, num2)
  num1, num2 = num2, num1 if num2.chars.count > num1.chars.count
  mapping = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }
  extra = 0
  result = num1.dup
  j = num1.chars.count - 1
  len = num2.chars.count - 1
  for i in (len..0).step(-1)
    c = mapping[num1.chars[j]] + mapping[num2.chars[i]] + extra
    result[j] = (c % 10).to_s
    extra = c / 10
    j -= 1
  end
  while j >= 0
    c = mapping[num1.chars[j]] + extra
    result[j] = (c % 10).to_s
    extra = c / 10
    j -= 1
  end
  if extra > 0
    result = " " + result
    result[0] = extra.to_s
  end
  return result
end

def add_strings1(num1, num2)
  num1, num2 = num2, num1 if num2.chars.count > num1.chars.count
  mapping = { "0" => 0, "1" => 1, "2" => 2, "3" => 3, "4" => 4, "5" => 5, "6" => 6, "7" => 7, "8" => 8, "9" => 9 }
  extra = 0
  result = []
  j = num1.chars.count - 1
  len = num2.chars.count - 1
  for i in (len..0).step(-1)
    c = mapping[num1.chars[j]] + mapping[num2.chars[i]] + extra
    result << c % 10
    extra = c / 10
    j -= 1
  end
  while j >= 0
    c = mapping[num1.chars[j]] + extra
    result << c % 10
    extra = c / 10
    j -= 1
  end
  result << extra if extra > 0
  return result.reverse.join("")
end

for i, r in { ["1", "9"] => "10", ["11", "123"] => "134", ["456", "77"] => "533", ["12312343", "52134123131231"] => "52134135443574" }
  my = add_strings1(i.first, i.last)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{my == r ? "pass" : "fail"}"
end
