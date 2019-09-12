#!/usr/local/bin/ruby

def convert(a)
  b = []
  a.each do |number|
    b << number.to_s(16)
  end
  b
end

puts "begin..."
loop do
  s = gets
  puts "s: #{s}"
  b = convert(s.bytes)
  puts "s.bytes: #{b}"
  b = convert(s.chomp.bytes)
  puts "s.chomp.bytes: #{b}"
  break if s.chomp == "quit"
end
puts "end."
