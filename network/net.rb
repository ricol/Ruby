#!/usr/bin/env ruby

require "net/http"
if ARGV.length < 1
  puts "Usage: ruby net.rb <URL>"
  exit 0
end
url = ARGV[0]
response = Net::HTTP.new(url, 80).get("/", nil)
puts "Code = #{response.code}, Message = #{response.message}"
response.each do |key, val|
  puts "#{key} = #{val}"
end
puts "Data length: #{response.body.length}"
print "Show date (y/n):"
reply = STDIN.readline.chomp!
if reply =~ /[Yy]/
  puts response.body
end
