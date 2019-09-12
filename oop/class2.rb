#!/usr/local/bin/ruby

class MyError < StandardError
end

def factorial(n)
  raise "bad argument" if n < 1
  return 1 if n == 1
  n * factorial(n - 1)
end

n = 10
puts "factorial(#{n})=" + factorial(n).to_s
