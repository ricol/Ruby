#!/usr/bin/evn ruby

def test(h, m, s)
	return nil if m >= 60 || s >= 60
	total = h * 3600 + m * 60 + s
	hh = total / 3600
	mm = total % 60
	ss = total - hh * 3600 - mm * 60
	pass = hh == h && mm == m && ss == s
	return pass
end

def test1(h, m, s)
	return nil if m >= 60 || s >= 60
	total = h * 3600 + m * 60 + s
	hh = total / 3600
	total -= h * 3600
	mm = total / 60
	total -= mm * 60
	ss = total
	pass = hh == h && mm == m && ss == s
	return pass
end

puts "testing h, m, s..."
total = 100
pass = 0
failure = 0
ignored = 0
total.times do
	result = test((rand * 100).to_i, ((rand * 100) % 60).to_i, ((rand * 100) % 60).to_i) 
	if result.nil?
		ignored += 1
	elsif result
		pass += 1
	else
		failure += 1
	end
end
puts "completed test with result: total(#{total}), pass(#{pass}), failure(#{failure}), ignored(#{ignored})"

puts "testing h, m, s with test1..."
total = 100
pass = 0
failure = 0
ignored = 0
total.times do
	result = test1((rand * 100).to_i, ((rand * 100) % 60).to_i, ((rand * 100) % 60).to_i) 
	if result.nil?
		ignored += 1
	elsif result
		pass += 1
	else
		failure += 1
	end
end
puts "completed test1 with result: total(#{total}), pass(#{pass}), failure(#{failure}), ignored(#{ignored})"

def test2(h, m)
	return nil if m >= 60
	total = h * 60 + m
	hh = total / 60
	mm = total % 60
	pass = hh == h && mm == m
	return pass
end

def test3(h, m)
	return nil if m >= 60
	total = h * 60 + m
	hh = total / 60
	mm = total - hh * 60
	pass = hh == h && mm == m
	return pass
end

puts "testing h, m with test2..."
total = 100
pass = 0
failure = 0
ignored = 0
total.times do
	result = test2((rand * 100).to_i, ((rand * 100) % 60).to_i) 
	if result.nil?
		ignored += 1
	elsif result
		pass += 1
	else
		failure += 1
	end
end
puts "completed test2  with result: total(#{total}), pass(#{pass}), failure(#{failure}), ignored(#{ignored})"

puts "testing h, m with test3..."
total = 100
pass = 0
failure = 0
ignored = 0
total.times do
	result = test3((rand * 100).to_i, ((rand * 100) % 60).to_i) 
	if result.nil?
		ignored += 1
	elsif result
		pass += 1
	else
		failure += 1
	end
end
puts "completed test3 with result: total(#{total}), pass(#{pass}), failure(#{failure}), ignored(#{ignored})"
