#!/usr/bin/env ruby

a = (1..10).to_a
mean = a.inject { |x, y| x + y } / a.size
sumOfSquares = a.map { |x| (x - mean) ** 2 }.inject { |x, y| x + y }
standardDeviration = Math.sqrt(sumOfSquares / (a.size + 1))
puts "a: #{a}"
puts "mean: #{mean}"
puts "sumOfSquares: #{sumOfSquares}"
puts "standardDeviration: #{standardDeviration}"
