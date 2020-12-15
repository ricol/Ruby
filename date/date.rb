#!/usr/bin/env ruby

require "date"

d = Date.new(2000, 3, 31)

puts [d.year, d.yday, d.wday]
puts [d.month, d.mday]
puts [d.cwyear, d.cweek, d.cwday]
puts [d.jd, d.mjd]
puts (d << 1).to_s
puts d.succ.to_s
puts (d + 100).to_s
puts d.leap?
puts Date.new(2000, 3, -10).to_s

begin
  d1 = Date.new(2000, 13, 7)
rescue StandardError
  puts "invalid date!"
end

puts d1.to_s

begin
  puts [d1.cwday, d1.wday]
rescue StandardError
  puts "invalid output!"
end
