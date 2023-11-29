#!/usr/bin/env ruby

f = Fiber.new do
  puts "Fiber says Hello"
  Fiber.yield
  puts "Fiber says Goodbye"
end

puts "Caller says Hello"
f.resume
puts "Caller says Goodbye"
f.resume

f = Fiber.new do |message|
  puts "Caller said: #{message}"
  message2 = Fiber.yield("Hello")
  puts "Caller said: #{message2}"
  "Fine"
end

response = f.resume("Hello")
puts "Fiber said: #{response}"
response2 = f.resume("How are you?")
puts "Fiber said: #{response2}"

def fibonacci_generator(x0, y0)
  Fiber.new do
    x, y = x0, y0
    loop do
      Fiber.yield y
      x, y = y, x + y
    end
  end
end

puts "fibonacci..."

g = fibonacci_generator(0, 1)
10.times do
  print g.resume, " "
end
puts ""
