#!/usr/bin/env ruby

def is_prime(num)
  return false if num <= 1
  return false if num != 2 and num % 2 == 0

  to = num / 2 + 1
  (3...to).step(2).each do |x| return false if num % x == 0 end
  return true
end

primes = []
(2..100).each do |x| primes << x if is_prime(x) end
puts primes

product = primes[0]
(1..primes.count).each do |i|
  new_num = product * primes[i] + 1
  puts "prime: #{primes[i]}, checking new num: #{new_num}..."
  STDOUT.flush
  puts(is_prime(new_num) ? "prime" : "not prime!")
  product *= primes[i]
end
