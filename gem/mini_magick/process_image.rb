#!/usr/bin/env ruby

require "mini_magick"

puts "processing..."
image = MiniMagick::Image.open("gem.png")
image.resize "50x50"
image.format "png"
image.write "test.png"
puts "done"
