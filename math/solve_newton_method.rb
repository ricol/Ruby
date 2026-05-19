#!/usr/bin/env ruby

def function(x)
  x ** x - 49 # can be any function
end

def derivative(x)
  del = 1e-10
  (function(x + del) - function(x)) / del # derivative of the function
end

puts "computing..."
previours = 1.0
x = 2
while (previours - x).abs >= 1e-10
  previours = x
  puts "checking x: #{x}"
  x = x - function(x) / derivative(x)
end
puts "x: #{x}"
