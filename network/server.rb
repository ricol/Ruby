#!/usr/bin/env ruby

require "socket"

server = TCPServer.new 2000
puts "Server is listening at port 2000..."

loop do
  client = server.accept
  puts "#{client} accepted..."
  client.puts "Hello!"
  client.puts "Time is #{Time.now}"
  client.close
  puts "#{client} closed."
end
