#!/usr/bin/env ruby

t = Time.now
puts "Today is: #{t.month}/#{t.day}/#{t.year} T #{t.hour}:#{t.min}:#{t.sec}"
puts "The computer's time zone is: #{t.zone}"
t1 = Time.utc(t.year, t.month, t.day, t.hour, t.min, t.sec)
puts "Offset: #{((t1 - t) / 3600).round} hours from UTC"
