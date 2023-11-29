#!/usr/bin/env ruby

filename = ARGV[0]
mode = ARGV[1]
if ARGV.length != 2
  puts "Usage: count.rb <filename> -m[w,c]"
  exit
end
hash = {}
file = File.open(filename, "r")
content = file.read
content.split(mode == "-w" ? " " : "").each do |word|
  num = hash[word] || 0
  hash[word] = num + 1
end
file.close
puts "result:"
puts "==============="
hash.keys.sort.each do |key|
  puts "#{key} => #{hash[key]}"
end
puts "================"
puts "#{filename} has #{hash.keys.count} #{mode == "-w" ? "words" : "characters"}."
