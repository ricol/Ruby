#!/usr/bin/env ruby

require "open-uri"

f = open(ARGV.first)
webpage = f.read
puts "content: " + webpage
f.close
