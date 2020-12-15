#!/usr/bin/env ruby

filename = "./fileDemo.rb"
puts File.basename(filename)
puts File.basename(filename, ".rb")
puts File.dirname(filename)
puts File.split(filename)
puts File.extname(filename)
