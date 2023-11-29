#!/usr/bin/env ruby

def fun(x)
  return 1 if x == 1
  x.times do
    return 1 + 1.0 / fun(x - 1)
  end
end

x = ARGV[0].to_i
puts "Golden Ratio: #{fun(x)} - X: #{x}"
