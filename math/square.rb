#!/usr/bin/env ruby

$NUM = 0.0

def f(x)
  return x * x - $NUM
end

def df(x)
  return 2 * x
end

def calculate(x0, delta = 1e-10)
  x1 = x0
  begin
    x = x1
    x1 = x - f(x) / df(x)
    yield x1 if block_given?
  end while (x1 - x).abs > delta
  return x1
end

begin
  puts "input number(-1 to quit)?"
  $NUM = gets.chomp.to_f
  break if $NUM == -1

  puts "calculating...#{$NUM}"
  STDOUT.flush
  result = calculate(1) { |x|
    puts "#{x}..."
  }
  puts "result: #{result}\n\n"
end until false
