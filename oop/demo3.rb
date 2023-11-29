#!/usr/bin/env ruby

class Point
  def initialize(x, y)
    @x = x
    @y = y
    @z = 0
    @other = -1
  end

  #	def initialize(x, y, z)
  #		self.initialize(x, y)
  #		@z = z
  #	end

  def to_s
    "(#@x, #@y, #@z, #@other)"
  end

  def x
    @x
  end

  def y
    @y
  end

  def x=(value)
    @x = value
  end

  def y=(value)
    @y = value
  end

  def <(point)
    @x ** 2 + @y ** 2 < point.x ** 2 + point.y ** 2
  end

  def >(point)
    @x ** 2 + @y ** 2 > point.x ** 2 + point.y ** 2
  end

  attr_reader :z
  attr_writer :z
  attr_accessor :other

  def ==(o)
    if o.is_a? Point
      @x == o.x && @y == o.y
    elsif false
    end
  end
end

p = Point.new(1, 2)
puts p.class
puts p.is_a?(Point)
puts p.is_a? Point
puts p

p.x = 10
p.y = 20
puts p
puts p.x
puts p.y
puts p.z
p.z = 100
puts p
puts p.z
puts p.other
p.other = 1000
puts p
p.z = 100
p = Point.new 1, 2
puts p
p1 = Point.new 2, 3
p2 = Point.new 1, 2
puts "p == p1: " + (p == p1).to_s
puts "p == p2: " + (p == p2).to_s

class Point
  def <=>(other)
    return false unless other.instance_of? Point
    @x ** 2 + @y ** 2 <=> other.x ** 2 + other.y ** 2
  end
end

puts "demo <=> for Point..."
p, q = Point.new(1, 0), Point.new(0, 1)
puts (p <=> q).to_s
puts (p == q).to_s
puts (p < q).to_s
puts (q > q).to_s

puts "demo <=> for bignum..."
n = 5
n.times { |x|
  a = rand(n)
  b = rand(n)
  puts "#{a} <=> #{b} = #{a <=> b}"
}

class Point
  def add!(p)
    return self unless p.instance_of? Point
    @x += p.x
    @y += p.y
    self
  end

  def add(p)
    q = self.dup
    q.add!(p)
  end
end

puts "demoe add! and add..."
p, q = Point.new(1, 2), Point.new(3, 4)
old = p.dup
s = p.add!(q)
puts "s: " + s.to_s
s = old.add(q)
puts "s: " + s.to_s

puts "demo class methods..."

class Point
  def Point.sum(*points)
    x, y = 0, 0
    points.each do |p|
      x += p.x
      y += p.y
    end
    Point.new(x, y)
  end
end

def print(array)
  array.each do |x|
    puts "#{x}: " + x.to_s
  end
end

a, b, c = Point.new(1, 10), Point.new(2, 12), Point.new(3, 13)
s = Point.sum(a, b, c)

print [a, b, c, s]

puts "demo class constants..."

class Point
  ORIGIN = Point.new(0, 0)
end

puts "#{Point::ORIGIN}"

puts "demo class variables and class method..."

class Point
  @@n = 0
  @@totalX = 0
  @@totalY = 0
  def self.report
    puts "Count: " + @@n.to_s
    puts "Average X: " + (@@totalX.to_f / @@n).to_s
    puts "Average Y: " + (@@totalY.to_f / @@n).to_s
  end

  def initialize(x, y)
    @x, @y, @z, @other = x, y, 0, 0
    @@n += 1
    @@totalX += x
    @@totalY += y
  end
end

a, b, c, d = Point.new(1, 2), Point.new(10, 20), Point.new(100, 200), Point.new(1000, 2000)

Point.report

class Point
  def initialize(x, y)
    @x, @y = x, y
  end

  private_class_method :new

  def Point.cartesian(x, y)
    new(x, y)
  end

  def Point.polar(r, theta)
    new(r * Math.cos(theta), r * Math.sin(theta))
  end

  def to_s
    "x: " + @x.to_f.to_s + "; y: " + @y.to_f.to_s
  end
end

begin
  p = Point.new(1, 2)
rescue Exception => e
  puts "exception: " + e.to_s
end
p1, p2 = Point.cartesian(1, 2), Point.polar(100, 200)
puts p1
puts p2
