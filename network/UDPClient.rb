#!/usr/bin/env ruby

require "socket"

host, port, request = "127.0.0.1", "2100", ""
ds = UDPSocket.new
ds.connect(host, port)
ds.send(request, 0)
response, address = ds.recvfrom(1024)
puts response
