#!/usr/bin/env ruby

require "net/http"

http = Net::HTTP.new(ARGV.last)
headers, body = http.get("/index.html")
if headers.code == "200"
  print body
else
  puts "#{headers.code} #{headers.message}"
end
