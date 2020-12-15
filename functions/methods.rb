#!/usr/bin/env ruby

def factorial(n)
  if n < 1
    raise "argument must be > 0"
  elsif n == 1
    1
  else
    n * factorial(n - 1)
  end
end

puts "demo factorial..."

n = 10
begin
  puts "factorial(#{n}): " + factorial(n).to_s
rescue Exception => e
  puts "exception: " + e.message
end

puts "demo object.method..."

begin
  o = "message"
  def o.printme
    puts self
  end
  o.printme
  o.printme
  o = "hello"
rescue Exception => e
  puts "exception: " + e.message
else
  puts "Everything works well.:)"
end

puts "demo alias..."

alias fac factorial

n = 20
puts "fac(#{n}): " + fac(n).to_s

def hello
  puts "hello world"
end

alias original_hello hello

def hello
  puts "Your attention please"
  original_hello
  puts "This has been a test"
end

hello

puts "demo argument list..."

def max(first, *rest)
  max = first
  rest.each { |x| max = x if x > max }
  max
end

puts "max(1, 2, 3, 4): " + max(1, 2, 3, 4).to_s

puts "demoe Proc.new..."
p = proc { |x| puts x }

def sequence(n, m, c, b)
  i = 0
  while i < n
    b.call(i * m + c)
    i += 1
  end
end

sequence(5, 2, 2, p)

puts "demo &..."

a = [1, 2, 3]
b = [4, 5]
summation = proc { |total, x| total + x }
sum = a.inject(0, &summation)
sum = b.inject(sum, &summation)
puts "Sum: #{sum}"
