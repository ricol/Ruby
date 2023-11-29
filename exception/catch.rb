#!/usr/bin/env ruby

def test
  puts "testing..."
  throw :ex
  puts "testing end."
end

puts "try catch..."
catch :ex do
  test
  puts "catch exception: #{:ex}"
end
puts "end."

puts "try rescue..."

begin
  test
  puts "after test"
rescue Exception => e
  puts "exception catched. #{e}"
ensure
  puts "ensure..."
end

puts "end."
