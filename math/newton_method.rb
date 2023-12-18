#!/usr/bin/env ruby

def f(x)
	return 3.0 * x * x + 4.0 * x + 1.0
end

def fd(x)
	return 6.0 * x + 4.0
end

def fun(x)
	return x - f(x) / fd(x)
end

if ARGV.size < 1
	puts "usage: app <initial value>"
	exit
end
previous = 0.0
x = ARGV.last.to_f
times = 0
while (x - previous).abs > 1e-6
	previous = x
	x = fun(x)
	times += 1
	break if times > 1e5
	puts "x: #{x}, accuracy: #{(x - previous).abs}"
end

puts "final result: #{x}, times: #{times}"
