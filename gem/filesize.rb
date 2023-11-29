#!/usr/bin/env ruby

require "filesize"

for size in [0, 10, 100, 1000, 10000, 1e6, 1e7, 1e8, 1e9, 1e10]
  puts "#{size} -> #{Filesize.from(size.to_s).pretty}"
end
