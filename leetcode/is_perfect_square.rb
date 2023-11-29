#!/usr/bin/env ruby

# @param {Integer} num
# @return {Boolean}
def is_perfect_square(num)
  n = num ** (1 / 2.0)
  return n - "#{n}".to_i == 0
end

def is_perfect_square1(num)
  i = 0
  j = num
  while i <= j
    m = (i + j) / 2
    mm = m * m
    if mm < num
      i = m + 1
    elsif mm > num
      j = m - 1
    else
      return true
    end
  end
  return false
end

for i, r in { 0 => true, 1 => true, 2 => false, 3 => false, 4 => true, 9 => true, 16 => true, 25 => true, 24 => false }
  my = is_perfect_square(i)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{my == r ? "pass" : "fail"}"
  my = is_perfect_square1(i)
  puts "input: #{i}, my result: #{my}, correct result: #{r} -> #{my == r ? "pass" : "fail"}"
end
