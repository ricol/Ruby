#!/usr/bin/env ruby

def method_name()
  puts "hi..."
rescue
  puts "rescue..."
else
  puts "else..."
ensure
  puts "ensure..."
end

method_name
