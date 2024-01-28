#!/usr/bin/env ruby

# @param {String} s
# @return {Boolean}
def check_record(s)
  absents = 0
  lates = 0
  s.chars.each do |x|
    if x == 'A'
      absents += 1
      lates = 0
      return false if absents >= 2
    elsif x == 'L'
      lates += 1
      return false if lates >= 3
    else
      lates = 0
    end
  end
  true
end

for i, r in {"PPALLP" => true, "PPALLL" => false, "LALL" => true, "LLLALL" => false}
  a = check_record(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
