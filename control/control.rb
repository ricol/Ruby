#!/usr/bin/env ruby

s = "?($ to quit)"
puts s
while (line = gets.chop)
  next if line[0, 1] == "#"
  break if line[0, 1] == "$"
  puts line
  puts s
end

puts "Please enter the first word you think of"
words = %w[apple banana cherry] # shorthand for ["apple", "banana", "cherry"]
response = words.collect do |word|
  print word + "> "
  response = gets.chop
  if response.empty?
    word.upcase!
    redo
  end
  response
end
