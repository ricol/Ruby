#!/usr/bin/env ruby

#Author: Ricol Wang
#Date: 18/01/2015

$dict = {}

def f(n)
  return $dict[n] if $dict[n]

  if n == 0 || n == 1
    result = 1
  elsif result = f(n - 2) + f(n - 1)
  end

  $dict[n] = result

  return result
end

if ARGV.length <= 0
  puts "Usage: app <number>"
  exit
end

num = ARGV[0].to_i

puts "calculating..."
1.upto(num) do |number|
  puts "#{number}: #{f(number)}"
end

puts "validating..."
2.upto(num) do |number|
  number1 = f(number)
  number2 = f(number - 1)
  puts "#{number}: #{number1} / #{number2} = #{(number1 * 1.0) / (number2 * 1.0)}"
end

puts "complete."
