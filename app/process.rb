#!/usr/bin/env ruby

dirs = Dir.entries(".")
dirs.each do |dir|
  next if File.directory?(dir)
  content = File.new(dir, "r").readlines
  content = content.select { |x| x if x != "\n" && x != "\r" && x && x != "\r\n" && x != 0xa }
  content = content.map { |line| line = line.delete("\n") }
  content = content.map { |line| line = line.rstrip }
  f = File.new(dir, "w")
  f.write(content.join("\n"))
  f.close
  puts "#{dir} updated."
end
puts "done."
