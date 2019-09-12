#!/usr/local/bin/ruby

if ARGV.count <= 0
  puts "Usage: printPrime <number>"
  exit
end

min = 2
max = ARGV[0].to_i
total = 0
min.upto(max) do |num|
  number = num / 2
  bIsPrime = true

  2.upto(number) do |i|
    if num % i == 0
      bIsPrime = false
      break
    end
  end

  if bIsPrime
    if total > 0
      print ", "
    end
    print "#{num}"
    total = total + 1
  end
end

puts "\nTotal Primes from #{min} to #{max}: #{total}"
