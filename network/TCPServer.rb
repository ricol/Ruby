#!/usr/bin/env ruby

require "socket"

server = TCPServer.open(2000)
while true
  puts "waiting for request..."
  client = server.accept
  puts "accepted."
  client.puts(Time.now.ctime)
  puts "message send."
  client.close
  puts "close connection."
end
