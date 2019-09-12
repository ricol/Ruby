#!/usr/local/bin/ruby

t = Thread.new do
  puts "thread start..."
  f = File.read("threadDemo.rb")
  f.puts(f.read)
  puts "thred end."
end

t
