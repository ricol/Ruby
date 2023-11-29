#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def is_power_of_two(n)
  return false if n <= 0
  return true if n == 1
  t = n
  loop do
    return false if t % 2 != 0
    t /= 2
    break if t <= 1
  end
  return true
end

for input, result in { -16 => false, 0 => false, 1 => true, 2 => true, 3 => false, 4 => true, 5 => false, 8 => true, 16 => true, 20 => false }
  myresult = is_power_of_two(input)
  puts "input: #{input}, my result: #{myresult}, result: #{result} => #{myresult == result ? "pass" : "fail"}"
end
