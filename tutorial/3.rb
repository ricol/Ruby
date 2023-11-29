#!/usr/bin/env ruby

puts $0
puts $:
puts $$

puts Float::MAX

rice_on_square = 1
64.times do |square|
  puts "On square #{square + 1} are #{"%d" % rice_on_square} grain(s)"
  rice_on_square *= 2
end

puts "I am in class = " + self.class.to_s
puts "I am an object = " + self.to_s
print "The object methods are = "
puts self.private_methods.sort
