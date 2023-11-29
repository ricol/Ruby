#!/usr/bin/env ruby

s = sprintf("pi is about %.4f", Math::PI)
puts "s = #{s}"

s = "pi is about %.4f" % Math::PI
puts "s = #{s}"

s = "%s: %f" % ["pi", Math::PI]
puts "s = #{s}"
