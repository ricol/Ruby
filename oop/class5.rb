#!/usr/bin/env ruby

class Dot
  @x = 0

  @@x = 0

  def initialize(x)
    @x = x
  end

  attr_accessor :x
end

dot = Dot.new(1)
puts "dot: #{dot}"

puts "dot.x: #{dot.x}"
dot.x = 2
puts "dot.x: #{dot.x}"

class Point
  def initialize(x, y)
    @x = x
    @y = y
  end

  def +(other)
    Point.new(@x + other.x, @y + other.y)
  end

  def -@
    Point.new(-@x, -@y)
  end

  def *(scalar)
    Point.new(@x * scalar, @y * scalar)
  end

  attr_accessor :x, :y

  def to_s
    "{#{@x}, #{@y}}"
  end
end

p = Point.new(1, 2)
puts "p: #{p}"

p1 = p + p
puts "p1: #{p1}"
p2 = -p
puts "p2: #{p2}"
p3 = p * 3
puts "p3: #{p3}"

class Point
  def each
    yield @x
    yield @y
  end
end

p = Point.new(1, 2)
p.each { |x| print x }
puts ""

class Point
  include Enumerable
end

p.x = 0, p.y = 0
puts "p: #{p}"
puts "#{p.all? { |x| x == 0 }}"

p.x = 0
p.y = 0
puts "p: #{p}"
puts "#{p.all? { |x| x == 0 }}"

class Point
  ORIGIN = Point.new(0, 0)
  UNIT_X = Point.new(1, 0)
  UNIT_Y = Point.new(0, 1)
end

puts Point::ORIGIN
puts Point::UNIT_X
puts Point::UNIT_Y
