#!/usr/bin/env ruby

def e(x)
	(1 + 1 / x) ** x
end

previous = nil
for v in [1, 2, 3, 4, 10, 100, 1e3, 1e4, 1e5, 1e6, 1e7, 1e8, 1e9]
	a = e(v)
	print "\ne: #{a}"
	puts "\tdiff: #{a - previous}" if previous != nil
	previous = a
end
