#!/usr/bin/env ruby

class Integer
  @@factorial_results = [1, 1]

  def fact
    @@factorial_results[self] ||= self * (self - 1).fact
  end

  def show_mems
    @@factorial_results.inspect
  end
end

exit unless ARGV[0]
num = ARGV[0].to_i
puts "#{num}! = #{num.fact}"
