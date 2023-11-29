#!/usr/bin/env ruby

p = proc { |x, y| x + y }

puts (p.call 2, 3).to_s

succ = ->(x) { x + 1 }

puts succ.call(1).to_s

succ = ->(x) { x + 1 }

puts succ.call(2).to_s

a = ->(x) { x * x }
n = 10
puts "a.call(#{n}): #{a.call(n)}"
r = ->(x) { x * x } == ->(x) { x * x }
puts "r: #{r}"
r = (->(x) { x * x } == ->(x) { x * x })
puts "r: #{r}"
puts (->(x) { x * x } == ->(x) { x * x }).to_s

b = a.dup
puts "a.id: #{a.object_id}, b.id: #{b.object_id}"
puts "a == b ? #{a == b}"

p = proc do |x, y|
  print x, y
  puts ""
end

p.call(1)
p.call(1, 2)
p.call(1, 2, 3)
p.call([1, 2])

l = lambda { |x, y|
  print x, y
  puts ""
}
# l.call(1)
l.call(1, 2)
# l.call(1, 2, 3)
# l.call([1, 2])
l.call(1, 2)
