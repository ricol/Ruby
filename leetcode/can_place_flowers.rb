#!/usr/bin/env ruby

# @param {Integer[]} flowerbed
# @param {Integer} n
# @return {Boolean}
def can_place_flowers(flowerbed, n)
  data = flowerbed.dup
  flowerbed.each_with_index do |value, index|
    if value == 0
      isLeftValid = false
      isRightValid = false
      if index - 1 >= 0
        isLeftValid = true if data[index - 1] == 0
      else
        isLeftValid = true
      end
      if index + 1 < data.count
        isRightValid = true if data[index + 1] == 0
      else
        isRightValid = true
      end
      if isLeftValid && isRightValid
        n -= 1
        data[index] = 1
        return true if n <= 0
      end
    end
  end
  return true if n <= 0
  false
end

for i, r in {[[1,0,0,0,1], 1] => true, 
[[1,0,0,0,1], 2] => false, 
[[1,0,0,0,0,1], 2] => false, 
[[0,0,1,0,1], 1] => true, 
[[0,0,1,0,0], 1] => true,
[[0,0,0,0,0,1,0,0], 0] => true}
  a = can_place_flowers(i.first, i.last)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
