#!/usr/bin/env ruby

File.open("fileDemo.rb") do |f|
  line = f.readline
  puts line
end
