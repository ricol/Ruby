#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
$cache1 = {}

def is_prime?(num)
  is_prime = true
  range_min = 2
  range_max = num / 2
  (range_min..range_max).each do |number|
    if num % number == 0
      is_prime = false
      break
    end
  end
  return is_prime if num != 1
  false
end

def test1(max)
  min = 2
  total = 0
  (min..max).each do |num|
    if $cache1[num]
      total += 1
      next
    else
      if is_prime?(num)
        total += 1
        $cache1[num] = true
      end
    end
  end
  puts "Total: #{total} in #{max} -> ratio: #{total / (max * 1.0)}" if max % 1000 == 0
  total
end

$cache2 = {}

def test2(max)
  total = 0
  if $cache2[max - 1]
    previous = $cache2[max - 1]
    total = previous
    total += 1 if is_prime?(max)
  else
    ((max - 1)..max).each do |num|
      total += 1 if is_prime?(num)
    end
  end
  puts "Total: #{total} in #{max} -> ratio: #{total / (max * 1.0)}" if max % 1000 == 0
  $cache2[max] = total
end

(2..10_000).each do |max|
  test2(max)
end
