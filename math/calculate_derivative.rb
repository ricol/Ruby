#!/usr/local/bin/ruby

def f(x)
	return Math.sin(x)
end

def df(f, x, del)
	del_x = del 
	del_y = f.call(x + del_x) - f(x)
	return del_y / del_x
end

del = 0.1
x = ARGV.last.to_f
old = 1
diff = 1e10
10.times do 
	derivative = df(method(:f), x, del)
	puts("x: #{x}, del: #{del} -> derivative: #{derivative}, diff: #{derivative - old}")
	old = derivative
	del *= 0.1
end
print("end.")
