#!/usr/bin/env ruby

=begin  
 Ruby Numbers  
 Usual operators:  
 + addition  
 - subtraction  
 * multiplication  
 / division  
=end

puts 1 + 2
puts 2 * 3
# Integer division
# When you do arithmetic with integers, you'll get integer answers
puts 3 / 2
puts 10 - 11
puts 1.5 / 2.6

puts (5 % 3) # prints  2
puts (-5 % 3) # prints  1
puts (5 % -3) # prints -1
puts (-5 % -3) # prints -2

puts nil || 2008
puts false || 2008
puts "ruby" || 2008

def g(*args) # The splat here says accept 1 or more arguments, in the form of an Array
  args # This returns an array
end

def f(arg)
  arg
end

x, y, z = [true, "two", false] # parrallel assignment lets us do this

if a = f(x) and b = f(y) and c = f(z)
  d = g(a, b, c) # An array is returned, and stored in variable d
end

p d # using p to puts and inspect d
