#!/usr/bin/env ruby

$glob = 5

class TestVar
  @@cla = 6
  CONST_VAL = 7

  def initialize(x)
    @inst = x
    @@cla += 1
  end

  def self.cla
    @@cla
  end

  def self.cla=(y)
    @@cla = y
  end

  def inst
    @inst
  end

  def inst=(i)
    @inst = i
  end
end

puts $glob
test = TestVar.new(3)
puts TestVar.cla
puts test.inspect
TestVar.cla = 4
test.inst = 8
puts TestVar.cla
puts test.inst
other = TestVar.new(17)
puts other.inspect
puts TestVar.cla

class A
  @@value = 1
  def A.value
    @@value
  end
end

puts A.value

class B < A
  @@value = 2
end

puts A.value

class C < A
  @@value = 3
end

puts B.value
