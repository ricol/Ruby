#!/usr/bin/env ruby

require "singleton"

class PointStats
  include Singleton

  def initialize
    @n = 0
  end

  def record(point)
    @n += 1
  end

  def report
    puts "Count: #{@n}"
  end
end

class Point
  def initialize(x, y)
    @x, @y = x, y
    PointStats.instance.record(self)
  end
end

n = 10000
n.times do
  x = rand(n)
  y = rand(n)
  p = Point.new(x, y)
end

PointStats.instance.report
