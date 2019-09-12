#!/usr/local/bin/ruby

filename = Dir.entries
Dir.foreach do |filename|
  system("unzip #{filename}")
end
