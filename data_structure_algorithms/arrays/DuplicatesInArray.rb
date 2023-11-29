#!/usr/bin/env ruby

#Given an array of length n contains elements from 0 to n-1,
#Print all the duplicate elements in O(n) time and constant space.

def print_duplicates(a)
  n = a.length
  print "Duplicate elements are: "
  for i in 0...n
    if a[a[i].abs] < 0
      print "#{a[i].abs} "
    else
      a[a[i].abs] = -a[a[i].abs]
    end
  end
  return
end

data = []
N = 10
N.times do data << rand(N) end
puts "#{data}"
print_duplicates(data)
puts
