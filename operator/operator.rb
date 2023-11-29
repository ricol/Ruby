#!/usr/bin/env ruby

puts "1 + 2 = #{1 + 2}"
puts "1 - 2 = #{1 - 2}"
puts "1 * 2 = #{1 * 2}"
puts "1 / 2 = #{1 / 2}"
puts "2 % 1 = #{2 % 1}"
puts "2 ** 2 = #{2 ** 2}"
puts "2 | 1 = #{2 | 1}"
puts "2 & 1 = #{1 & 1}"
puts "2 ^ 1 = #{2 ^ 1}"
puts "2 << 1 = #{2 << 1}"
puts "2 >> 1 = #{2 >> 1}"

class MyClass
  def initialize(n)
    @a = []
    n.times do |x|
      @a += [rand(n)]
    end
  end

  def [](index)
    return @a[index] if index >= 0 && index <= @a.length - 1
    nil
  end

  def +(index)
    self[index]
  end

  def each1(&block)
    for n in @a
      block.call n
    end
  end

  def each2
    for n in @a
      yield n
    end
  end

  alias each each1
end

n = 10
object = MyClass.new(n)

puts "demo operator []..."
n.times do |x|
  print "object[#{x}]=#{object[x]}"
  puts ""
end

puts "demo operator + ..."
n.times do |x|
  puts "object+#{x}:#{object + x}"
end

object.each do |x| print "#{x}\t" end
puts

p (0b1011 << 1).to_s(2)
p (0b1011 << 1).to_s(10)
p (0b1011 << 1).to_s(8)
p (0b1011 << 1).to_s(16)
p (0b1010 & 0b1100).to_s(2)
p (0b1010 | 0b1100).to_s(2)
p (0b1010 ^ 0b1100).to_s(2)
p (~0b1000).to_s(2)
