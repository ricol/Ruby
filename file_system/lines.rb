#!/usr/bin/env ruby

if ARGV.length < 1
  puts "Usage: app <filename>"
  exit
end

charcount = 0
linecount = 0
f = File.new(ARGV[0], "r")
while !f.eof
  c = f.getc()
  if c == '\r'
    linecount += 1
  else
    charcount += 1
  end
end

f.close
puts("This file contains #{linecount} lines and #{charcount} characters.")
