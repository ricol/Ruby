#!/usr/bin/env ruby

pq = Containers::PriorityQueue.new

pq.push("Job A", 15)
pq.push("Job B", 12)
pq.push("Job C", 33)

pq.pop # => "Job C"
pq.pop # => "Job A"
pq.size # => 1

puts pg
