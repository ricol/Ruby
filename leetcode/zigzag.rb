#!/usr/bin/env ruby

def convert(s, num_rows)
  hash = {}
  max_x = 0
  max_y = 0
  x, y = 0, 0
  down = true
  s.chars.each do |c|
    hash["#{x}_#{y}"] = c
    if down
      if x < num_rows - 1
        x += 1
        max_x = x if x > max_x
      else
        down = false
        x -= 1 if x > 0
        y += 1
        max_y = y if y > max_y
      end
    else
      if x > 0
        x -= 1
        y += 1
        max_y = y if y > max_y
      else
        down = true
        if x < num_rows - 1
          x += 1
        else
          y += 1
        end
        max_x = x if x > max_x
      end
    end
  end
  result = []
  for x in 0..max_x
    for y in 0..max_y
      key = "#{x}_#{y}"
      s = hash[key]
      result << s if !s.nil?
    end
  end
  result.join
end

def convert_new(s, num_rows)
  return s if num_rows == 1 || s.length <= num_rows

  rows = Array.new(num_rows) { "" }
  current_row = 0
  going_down = false

  s.each_char do |char|
    rows[current_row] += char
    if current_row == 0 || current_row == num_rows - 1
      going_down = !going_down
    end
    current_row += going_down ? 1 : -1
  end

  rows.join
end

inputData = { ["PAYPALISHIRING", 3] => "PAHNAPLSIIGYIR",
             ["PAYPALISHIRING", 4] => "PINALSIGYAHRPI",
             ["A", 1] => "A",
             ["AB", 1] => "AB",
             ["ABC", 1] => "ABC" }

for i, r in inputData
  a = convert(i.first, i.last)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? "pass" : "fail"}"
end

for i, r in inputData
  a = convert_new(i.first, i.last)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? "pass" : "fail"}"
end
