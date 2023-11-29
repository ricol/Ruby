#!/usr/bin/env ruby

class Integer
  @@fibonacci_results = [1, 1]

  def fib
    @@fibonacci_results[self] ||= (self - 1).fib + (self - 2).fib
  end
end

exit unless ARGV[0]
num = ARGV[0].to_i
(0..num).each do |x|
  puts x.fib
end
