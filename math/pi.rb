#!/usr/bin/env ruby

def calculate(n, l)
  a = l / 2.0
  b = Math.sqrt(1 - a ** 2)
  c = Math.sqrt((1 - b) ** 2 + a ** 2)
  pi = n * c
  return 2 * n, c, pi
end

def test(start, side, t)
  n, l = start, side
  puts "Start with #{n} polygon, side: #{l}..."
  t.times do |i|
    n, l, pi = calculate(n, l)
    puts "[#{i}] polygon: #{n}, side: #{l} -> pi: #{pi}"
  end
end

if ARGV.length <= 0
  puts "Usage: calculate_pi.rb <times>"
  exit
end

t = ARGV.last.to_i
test(4, Math.sqrt(2), t)
test(6, 1, t)
