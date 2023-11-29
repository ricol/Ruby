#!/usr/bin/env ruby

e = "a"
c = "好"
puts e
puts c
puts "e.length: #{e.length}"
puts "c.length: #{c.length}"
puts "e.size: #{e.size}"
puts "c.size: #{c.size}"
puts "e.bytes: #{e.bytes}"
puts "c.bytes: #{c.bytes}"
puts "e.chars.count: #{e.chars.count}"
puts "c.chars.count: #{c.chars.count}"
s = e.center(80)
s[0] = "#"
s[-1] = "#"
puts s
s = c.center(80)
s[0] = "#"
s[-1] = "#"
puts s
puts "=~ /\p{Han}/: #{e =~ /\p{Han}/}"
puts "=~ /\p{Han}/: #{c =~ /\p{Han}/}"
