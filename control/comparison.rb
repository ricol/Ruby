#!/usr/bin/env ruby

a = "ruby"
b = c = "ruby"
puts "#{a.equal?(b)} : #{a == b} : #{a === b}"
puts "#{b.equal?(c)} : #{b == c} : #{b === c}"
d = b
puts "#{b.equal?(d)} : #{b == d} : #{b === d}"
d = "ruby"
puts "#{b.equal?(d)} : #{b == d} : #{b === d}"

a = "ruby"
b = "RUBY"
puts "#{a > b}: #{a >= b} : #{a == b} : #{a <= b} : #{a < b}, #{a <=> b}, #{a != b}"
