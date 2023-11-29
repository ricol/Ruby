#!/usr/bin/env ruby

def is_prime?(n)
  return false if n < 2
  return true if n == 2 or n == 3
  2.upto(n / 2).each do |x| return false if n % x == 0 end
  return true
end

def get_primes(data, max)
  checked = []
  bIgnore = false
  2.upto(max / 2).each do |n|
    bIgnore = false
    checked.each do |c|
      if n % c == 0
        bIgnore = true
        break
      end
    end
    checked << n
    next if bIgnore
    data.reject! { |x| x > n and x % n == 0 }
  end
  return data
end

puts "calculating primes..."

primes = []
MAX = 1e4
2.upto(MAX).each do |x|
  primes << x
end
get_primes(primes, MAX)

puts "total primes: #{primes.count}"
# puts "primes: #{primes}..."
current = 0
total = 0
a = 0
b = 0
1.upto(MAX).each do |n|
  while current < primes.count
    primes[current] <= n ? (total += 1; current += 1) : break
  end
  a = 1.0 * total / n
  b = 1.0 / Math.log10(n)
  print "n: #{n} -> total: #{total} -> #{a} -> #{a / b}\n"
end
