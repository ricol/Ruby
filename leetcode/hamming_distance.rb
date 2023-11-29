#!/usr/bin/env ruby

def to_b(num)
	data = []
	r = num
	while r >= 2
		data << r % 2
		r = r / 2
	end
	data << r
	return data.reverse.join.to_s
end

# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
	xx = []
	yy = []
	position = -1
	detect = -1
	r1, r2 = 0, 0

	while x >= 1 || y >= 1
		position += 1

		r1 = x % 2
		puts "x: #{x}, r1: #{r1}..."
		xx << r1
		x = x / 2

		r2 = y % 2
		puts "y: #{y}, r2: #{r2}..."
		yy << r2 
		y = y / 2
	
		puts "r1: #{r1}, r2: #{r2}"
		if r1 != r2
			puts "detect difference at: #{position}"
			if detect > -1
				puts "#{xx.reverse.join.to_s}, #{yy.reverse.join.to_s}"
				return position - detect + 1
			else
				detect = position
			end
		else
			puts "continue..."
		end
	end
	puts "exit while...with x: #{x}, r1: #{r1}, y: #{y}, r2: #{r2}..."

	xx << x
	yy << y
	puts "#{xx.reverse.join.to_s}, #{yy.reverse.join.to_s}"
	return position + 1 - detect
end

for i, r in {[1, 4] => 2, [3, 1] => 1, [0, 1] => 1, [4, 2] => 2}
	answer = hamming_distance(i.first, i.last)
	puts "input: #{i}, expect: #{r}, actual: #{answer} -> #{r == answer ? 'pass' : 'fail'}"
end
