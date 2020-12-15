#!/usr/bin/env ruby

english_character = "a"
english_character = "好"
puts "e.length: #{english_character.length}"
puts "c.length: #{english_character.length}"
puts "e.size: #{english_character.size}"
puts "c.size: #{english_character.size}"
puts "e.bytes: #{english_character.bytes}"
puts "c.bytes: #{english_character.bytes}"
puts "e.chars.count: #{english_character.chars.count}"
puts "c.chars.count: #{english_character.chars.count}"
s = english_character.center(80)
s[0] = "#"
s[-1] = "#"
puts s
s = english_character.center(80)
s[0] = "#"
s[-1] = "#"
puts s
puts "=~ /\p{Han}/: #{english_character =~ /\p{Han}/}"
puts "=~ /\p{Han}/: #{english_character =~ /\p{Han}/}"
