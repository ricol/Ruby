#!/usr/bin/env ruby

# @param {String} s
# @param {Integer} k
# @return {String}
def license_key_formatting(s, k)  
  chars = []
  total = 0
  s.chars.each do |x|
    if x != '-'
      chars << x
      total += 1
    end
  end
  segments = total / k
  offset = k - (total - segments * k)
  result = []
  num = 0
  total = 0
  checked = false
  chars.each do |x|
    num += 1
    total += 1
    result << x.upcase
    if !checked && num + offset == k && total < chars.size
      result << '-'
      checked = true
      num = 0
    else
      if num % k == 0 && total < chars.size
        result << '-'
        num = 0
      end
    end
  end
  return result.join
end

for i, r in {["5F3Z-2e-9-w", 4] => "5F3Z-2E9W", ["2-5g-3-J", 2] => "2-5G-3J", ["2-4A0r7-4k", 3] => "24-A0R-74K", ["R", 1] => "R"}
  a = license_key_formatting(i.first, i.last)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
