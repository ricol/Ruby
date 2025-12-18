#!/usr/bin/env ruby

def pi()
	puts "calculating..."
	inside = 0
	total = 1e8.to_i
	total.times do 
		x = 2 * rand * 1.0
	 	y = 2 * rand * 1.0
		if (x - 1) ** 2 + (y - 1) ** 2 < 1
			inside += 1
		end
	end
	4 * 1.0 * inside / total 
end

puts "pi: #{pi()}"
