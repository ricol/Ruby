#!/usr/bin/env ruby

from = ARGV[0]
to = ARGV[1]

def isPrime(num)
  return false if num <= 2
  result = true
  (2..num / 2).each do |n|
    if num % n == 0
      result = false
      break
    end
  end
  result
end

if from && to
  total = 0
  (from.to_i..to.to_i).each do |n|
    if isPrime(n)
      print "#{n}\t"
      total += 1
    end
  end
  puts ""
  puts "total: #{total}"
else
  puts "Usage: show_primes <from> <to>"
end
