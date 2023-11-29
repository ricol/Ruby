#!/usr/bin/env ruby

puts 0.step(100)

for i in 0.step(100)
  puts i
end

for i in 20.step(0, -1)
  puts i
end

for i in 100.step(0, -20)
  puts i
end

def range(start, stop, step = 1)
  for i in start.step(stop, step)
    yield i
  end
end

range(3, 12, 2) do |t| puts t end
range(3, 12) do |t| puts t end
range(3, 12, 2) { |t| puts t }
range(3, 12) {
  |t|
  puts t
}

name = "ricol"
for i in (0...name.length)
  puts name[i]
end
