#!/usr/bin/env ruby

# @param {String} s
# @return {String[]}
def letter_case_permutation(s)
  $characters = []
  result = [s]
  for i in 0...s.size
    c = s[i]
    if ("a".."z").include?(c)
      $characters << [c, i, 0]
    elsif $characters << [c, i, 1]
    end
  end
  return result
end

for input, result in { "a1b2" => ["a1b2", "a1B2", "A1b2", "A1B2"], "3z4" => ["3z4", "3Z4"], "12345" => ["12345"], "0" => ["0"] }
  myresult = letter_case_permutation(input)
  puts "input: #{input}, my result: #{myresult}, correct: #{result} -> #{myresult.sort == result.sort ? "pass" : "fail"}"
end

require "set"
a = Set.new(["a1b2", "a1B2", "A1B2", "A1b2"])
b = Set.new(["a1b2", "a1B2", "A1b2", "A1B2"])
puts "#{a == b}"
