#!/usr/local/bin/ruby

C = 1.0 * 3e10

def delta(v)
  return Math.sqrt(1.0 - (v / C) ** 2)
end

def V(a, t)
  return 0.5 * a * t * t
end

v = 0
a = 100
t = 0
l = 1.0
while v < C
  v = V(a, t)
  t += 1
  puts "[#{t}] V: #{v} -> L: #{l * delta(v)}"
end
