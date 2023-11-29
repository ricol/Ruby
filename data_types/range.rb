#!/usr/bin/env ruby

puts "#{1..10}"
puts "#{1...10}"
puts "#{(1..10).to_a}"
puts "#{(1...10).to_a}"

r = "a".."z"
r.each do |c| print c end
puts
p r.to_a
p r.include?("c")
p r.member?("c")
p r.member?("C")
