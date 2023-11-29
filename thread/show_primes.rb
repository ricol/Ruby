#!/usr/bin/env ruby

def is_prime(number)
  (2..number / 2).each do |value|
    return false if number % value == 0
  end
  return true
end

def show_primes(num)
  data = []
  (2..num).each do |number|
    data << number if is_prime(number)
  end
  puts "Thread: #{Thread.current} printing all primes upto #{num}: #{data.size}"
  STDOUT.flush
end

threads = []
10.times do
  aThread = Thread.new do
    show_primes((rand * 1e5 + 10).to_i)
  end
  threads << aThread
end

threads.each do |thread| thread.join end

puts "Thread.list: #{Thread.list}"
