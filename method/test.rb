#!/usr/local/bin/ruby

def test(a, *b, **c)
	puts "a: #{a}"
	puts "b: #{b}"
	puts "c: #{c}"

	if block_given?
		for i in 10.times
			yield i
		end
	end
end

test(1, 2, 3, 4, 5, name: 'ricol', age: 35)
test 1, 2, 3, 4, 5, name: 'ricol', age: 35
test 1, 2, 3, 4, 5, name: 'ricol', age: 35 do |t|
	puts t 
end
