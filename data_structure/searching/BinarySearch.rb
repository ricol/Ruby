#!/usr/local/bin/ruby

# Binary Search Algorithm
# Time Complexity = o(logn)
# Precondition: List should be sorted

def binary_search(a, key) # a is the array and key is the value to be found
  lo = 0
  hi = a.length - 1

  while (lo <= hi)
    mid = lo + ((hi - lo) / 2)

    if a[mid] == key
      return mid
    elsif a[mid] < key
      lo = mid + 1
    else
      hi = mid - 1
    end
  end

  return "Value not found in array"
end

a = []
100.times do a << rand(100) end
a.sort!
puts "#{a}"
n = rand(100)
puts "Searching #{n}..."
index = binary_search(a, n)
puts "#{index}"
puts "#{a[index]}"
