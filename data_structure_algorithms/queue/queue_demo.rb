#!/usr/bin/env ruby

puts "demoe ruby queue..."
queue = Queue.new()
(1..10).each do |x| queue.enq(x) end
puts "queue: #{queue}, size: #{queue.size}"
while !queue.empty?
  print "#{queue.deq}\t"
end
puts
