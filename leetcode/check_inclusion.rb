#!/usr/bin/env ruby

# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  return true
end

for input, result in { ["ab", "eidbaooo"] => true, ["ab", "eidboaoo"] => false }
  myresult = check_inclusion(input.first, input.last)
  puts "input: #{input}, my result: #{myresult}, result: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
