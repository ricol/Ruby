#!/usr/bin/env ruby

require "set"

a = (1..5)
b = [1..5]
set1 = a.to_set
set2 = b.to_set
puts "#{set1}"
puts "#{set2}"
puts set1
puts set2
puts set1.length
puts set2.size
set3 = Set[2, 3, 5, 7]
puts set3
puts set3.length
puts set3.size
primes = set3
odds = Set[1, 3, 5, 7, 9]
set1 = primes & odds
set2 = primes - odds
set3 = odds - primes
set4 = primes ^ odds

def printSet(s)
  if s.instance_of? Set
    s.each do |x|
      print x.to_s + ", "
    end
  else
    puts "printSet: not a set"
  end
  puts ""
end

puts "demo printSet..."
printSet(primes)
printSet(odds)
printSet(set1)
printSet(set2)
printSet(set3)
printSet(set4)

puts "demo printSets..."

def printSets(*s)
  s.each do |s|
    if s.instance_of? Set
      printSet(s)
    else
      puts "printSets: not a Set! converting..."
      begin
        set = s.to_set
        printSet(set)
      rescue StandardError
        puts "printSets: can't convert!"
      end
    end
  end
end

printSets(primes, odds, set1, {}, (1..10), set2, 2, set3, "wangxinge", set4, [1, 2, 3])
