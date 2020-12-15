#!/usr/bin/env ruby

def circle(r, n)
  n.times do |i|
    angle = Math::PI * 2 * i / n
    yield r * Math.cos(angle), r * Math.sin(angle)
  end
end

circle(1, 4) { |x, y| printf "(%.2f, %.2f) \n", x, y }
circle(1, 4) do |x, y|
  printf("%.2f, %.2f\n", x, y)
end
