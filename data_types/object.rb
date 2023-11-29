#!/usr/bin/env ruby

s = "ruby"
t = s
puts "t: #{t}"
puts "s: #{s}"
t[-1] = ""
puts "s: #{s}"
t = "java"
puts "s: #{s}"
puts "t: #{t}"

a = "ruby"
b = c = "ruby"
p a.equal?(b)
p b.equal?(c)
p a == b
p a == c
p b == c
p a.object_id
p b.object_id
p c.object_id
