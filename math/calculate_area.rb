#!/usr/bin/env ruby

size = 1
r = size / 2.0
center_x, center_y = size / 2.0, size / 2.0
square_area = size * size

total = 1e5
in_area = 0
total.to_i.times do
  x, y = ((rand * 10) / 10) * size, ((rand * 10) / 10) * size
  in_area += 1 if Math.sqrt((x - center_x) ** 2 + (y - center_y) ** 2) <= r
end

circle_area = in_area.to_f * square_area / total.to_f
pi = circle_area / (r ** 2)

puts "size: #{size}, r: #{r}, square_area: #{square_area}, in_area: #{in_area}/#{total}\ncircle_area: #{circle_area}\npi: #{pi}"
