#!/usr/bin/env ruby

def sqrt_new(n, precision)
  x = n
  while (x * x - n).abs > precision
    y = x * x - n
    a = y - 2.0 * x * x
    x = (-1 * a) / (2.0 * x)
  end
  x
end

precision = 1e-10
puts "precision: #{precision}"

for num in (2...10)
  r = sqrt_new(num, precision)
  real = Math::sqrt(num)
  difference = (real - r).abs
  print("#{num} square root is: #{r} and real root is: #{real} with difference: #{difference} -> #{difference < precision ? "OK" : "FAILURE"}\n")
end
