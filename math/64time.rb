#!/usr/bin/env ruby

rice_on_square = 1
64.times do |square|
  puts "on square #{square + 1} are #{rice_on_square} grain(s)"
  rice_on_square *= 2
end
