#!/usr/bin/env ruby

def prefix(s, len = 1)
  s[0, len]
end

puts prefix("Ruby", 3)
puts prefix("Ruby")

def append(x, a = [])
  a << x
end

puts append("ricolwang")
puts append("Ricol!", %w[Hello World -From])
