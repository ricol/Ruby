#!/usr/bin/env ruby

class Point
  include Enumerable

  attr :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def to_s
    "Point: #{@x}, #{@y}"
  end

  def [](index)
    if index == 0 || index == -2 || index == :x || index == "x"
      @x
    elsif index == 1 || index == -1 || index == :y || index == "y"
      @y
    else
      nil
    end
  end

  def each
    yield @x
    yield @y
  end

  def ==(o)
    if o.is_a? Point
      @x == o.x && @y == o.y
    else
      false
    end
  end
end

p = Point.new(1, 2)
puts "p: #{p}"
puts "p.class: #{p.class}"
puts "p.is_a? Point: #{p.is_a? Point}"

puts "#{p[0]}, #{p[-2]}, #{p[:x]}, #{p["x"]}, #{p[1]}, #{p[-1]}, #{p[:y]}, #{p["y"]}"

p.each do |x|
  puts "each: #{x}"
end

r = p.all? do |x|
  x == 0
end

puts "r: #{r}"

p = Point.new(0, 0)
r = p.all? do |x|
  x == 0
end

puts "r: #{r}"

p1 = Point.new(0, 0)
p2 = Point.new(1, 1)
puts "p1 == p2: #{p1 == p2}"

p2 = Point.new(0, 0)
puts "p1 == p2: #{p1 == p2}"

p2 = p1
puts "p1 == p2: #{p1 == p2}"

class Point
  include Comparable

  def <=>(other)
    return nil unless other.instance_of? Point
    @x ** 2 + @y ** 2 <=> other.x ** 2 + other.y ** 2
  end
end

n = 10
num = 100
a = []
n.times do
  x = rand(num)
  y = rand(num)
  a << Point.new(x, y)
end

class Array
  def to_s
    s = ""
    self.each do |p|
      if p.instance_of? Point
        s << p.to_s << "(#{p.x ** 2 + p.y ** 2})" << ", "
      else
        nil
      end
    end
    return s
  end
end

puts "before: \n#{a}"
b = a.sort
puts "after: \n#{b}"
a.sort!
puts "sorted: \n#{a}"

class Point
  def self.sum(*points)
    x = y = 0
    points.each do |p|
      if p.instance_of? Point
        x += p.x
        y += p.y
      end
    end
    Point.new(x, y)
  end
end

s = Point.sum(a)
puts "Sum: #{s}"
s = Point.sum(*a)
puts "Sum: #{s}"

class << Point
  def sumNew(*points)
    Point.sum(*points)
  end
end

s = Point.sum(*a)
puts "Sum: #{s}"
s = Point.sumNew(*a)
puts "Sum: #{s}"

s = "wangxinghe"
puts "#{s[s.size - 2, 2]}"

class String
  def >>(o)
    n = o.to_i
    old = self[self.size - n, n]
    self[self.size - n, n] = ""
    old
  end
end

s = "wangxinghe"
puts "before: #{s}"
old1 = s >> 1
puts "after: #{s}"
old2 = s >> 2
puts "after: #{s}"
s << old2
puts "after: #{s}"
s << old1
puts "after: #{s}"

class Array
  def to_s
    s = "["
    self.each do |x|
      s << x.to_s << ","
    end
    s >> 1
    s << "]"
    s
  end
end

a = [1, 2, 3, 4]
puts "a: #{a}"
