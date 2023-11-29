#!/usr/bin/env ruby

if ARGV.length <= 0
  puts "Usage: app <filename>"
  exit
end

filename = ARGV[0]
File.open(filename) do |f|
  f.each_with_index do |line, number|
    next if line[0, 1] == "#"
    print "#{number}: #{line}"
  end
end
