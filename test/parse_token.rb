#!/usr/local/bin/ruby

def parse(token)
	total = token.chars.count
	result = []
	token.chars.each_with_index do |c, index|
		result << c
		result << " " if ((index + 1) % 8 == 0) and (index < total - 1)
	end
	return result.join
end

token = ARGV.last
result = parse(token)
puts "origial: #{token}"
puts "parsing: #{result}"
