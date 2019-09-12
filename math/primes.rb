#!/usr/local/bin/ruby

def isPrime(num)
  return false if num < 2
  half = num / 2
  (2..half).each do |n|
    return false if num % n == 0
  end
  true
end

def validate(numbers)
  numbers.each do |n|
    return false unless isPrime(n)
  end
  true
end

unless ARGV[0]
  puts "Usage: primes <num>"
  exit
end
max = 10_000
max = ARGV[0].to_i unless ARGV[0].nil?
NUM = max
puts "find all primes between 2 and #{NUM} method 1..."
$stdout.flush
numbers = (2..NUM).to_a
half = NUM / 2
(2..half).each do |num|
  newNumbers = []
  numbers.each do |n|
    newNumbers << n if n && ((n <= num) || n % num != 0)
  end
  numbers = newNumbers
end
puts "validating...#{validate(numbers) ? "OK" : "ERROR"}"
puts "total #{numbers.count}"
puts "find all primes between 2 and #{NUM} method 2..."
$stdout.flush
primes = []
(2..NUM).each do |num|
  primes << num if isPrime(num)
end
puts "validating...#{validate(primes) ? "OK" : "ERROR"}"
puts "total #{primes.count}"
puts "comparing two results...#{numbers == primes ? "OK" : "ERROR"}"
