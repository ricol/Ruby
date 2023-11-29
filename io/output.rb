#!/usr/bin/env ruby

TIME = 0.1
i = 1
f = 1.23
b = true
string = "abcdefg"
puts "welcome to Ruby world!"
STDOUT.flush
for s in ["i = #{i}", "f = #{f}", "b = #{b}", "string = #{string}", "Welcome to Ruby world!\n", "i = #{i}\n", "f = #{f}\n", "b = #{b}\n", "string = #{string}\n"]
  puts s
  sleep(TIME)
end
