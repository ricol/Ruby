#!/usr/bin/env ruby

require "socket"

puts "demo socket open..."
host, port = "127.0.0.1", "2000"
s = TCPSocket.open(host, port)
while line = s.gets
  puts line.chop
end
s.close

puts "demo socket open to block..."
TCPSocket.open(host, port) do |s|
  while line = s.gets
    puts line.chop
  end
end
