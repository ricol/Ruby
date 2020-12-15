#!/usr/bin/env ruby

a = Dir.home
puts "Dir.home: #{a} : #{a.class}"
a = Dir.entries(Dir.home)
puts "Dir.entries: #{a} : #{a.class}"
s = a.join("\n")
puts "s: #{s} : #{s.class}"

filename = Dir.entries("../Ruby")
puts filename
Dir.foreach("../Ruby") do |filename|
  print filename + ", "
end
puts ""

filename = "../Ruby/test1.rb"
puts "#{filename} exists ? " + (File.exist?(filename) ? "Yes" : "No")

puts File.size(filename).to_s if File.exist?(filename)

s = File.stat(filename)
puts s.file?
puts s.directory?
puts s.ftype
puts s.readable?
puts s.writable?
puts s.executable?
puts s.size
puts s.atime
puts s
