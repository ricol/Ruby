#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Point
  def initialize(x, y)
    @x = x #define instance variables
    @y = y
  end

  def x #define accessor of instance variable
    @x
  end

  def y
    @y
  end

  def x=(value) #define setter of instance variable
    @x = value
  end

  def y=(value)
    @y = value
  end

  def to_s
    "x: #{@x}, y: #{@y}"
  end

  def get_s
    "x: #{x}, y: #{y}"
  end

  def set_s
    self.x = 3
    self.y = 4
  end

  def length
    (@x * @x + @y * @y) ** 0.5
  end

  def self.max(*points) #define class static method
    return points[0] if points.length == 1
    result = points[0]
    points.each do |p| result = p if result.length < p.length end
    result
  end

  def Point.min(*points) #define class static method
    return points[0] if points.length == 1
    result = points[0]
    points.each do |p| result = p if result.length > p.length end
    result
  end
end

class << Point #open a class and define class static method
  def sum(*points)
    x = y = 0
    points.each do |p| x += p.x; y += p.y end
    Point.new(x, y)
  end
end

p1 = Point.new(2, 3)
p2 = Point.new(3, 4)
p3 = Point.new(2, 5)
p = Point.sum(p1, p2, p3)
puts "p1: #{p1}, p2: #{p2}, p3: #{p3}"
puts "sum: #{p}"
max = Point.max(p1, p2, p3)
puts "max: #{max}"
min = Point.min(p1, p2, p3)
puts "min: #{min}"
