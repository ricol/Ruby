#!/usr/local/bin/ruby

File.open("fileDemo.rb") do |f|
  line = f.readline
  puts line
end
