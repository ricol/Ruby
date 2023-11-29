#!/usr/bin/env ruby

require "webrick"
include WEBrick

if ARGV.length <= 0
  puts "Usage: ruby webrick.rb <root path>"
  exit 0
end
path = ARGV[0]
server = HTTPServer.new(:Port => 8000, :DocumentRoot => path)
trap("INT") { server.shutdown }
server.start
