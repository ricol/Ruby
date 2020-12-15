#!/usr/bin/env ruby

require "socket"

port = 2100
ds = UDPSocket.net
ds.bind(nil, port)
while true
  request, address = ds.recvfrom(1024)
  response = request.upcase
  clientaddr = address[3]
  clientname = address[2]
  clientport = address[1]
  ds.send(response, 0, clientaddr, clientport)
  puts "Connection from: #{clientname} #{clientaddr} #{clientport}"
end
