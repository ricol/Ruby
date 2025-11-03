#!/usr/bin/env ruby

# @param {Integer} n
# @return {String[]}
def fizz_buzz(n)
  result = []
  n.times.each do |i|
    i += 1
    if i % 3 == 0 and i % 5 == 0
      result << "FizzBuzz"
    elsif i % 3 == 0
      result << "Fizz"
    elsif i % 5 == 0
      result << "Buzz"
    else
      result << "#{i}"
    end
  end
  return result
end

for i, r in {3 => ["1","2","Fizz"], 5 => ["1","2","Fizz","4","Buzz"], 15 => ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]}
  a = fizz_buzz(i)
  puts "input: #{i}, expected: #{r}, actual: #{a} -> #{a == r ? 'pass' : 'fail'}"
end
