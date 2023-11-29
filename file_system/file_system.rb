#!/usr/bin/env ruby

full = "~/Download/temp.txt"

file = File.basename(full)
puts File.basename(full, ".txt")
puts File.dirname(full)
puts File.split(full)
puts File.extname(full)

Dir.chdir("/usr/bin")
filenames = Dir.entries("config")
puts filenames
