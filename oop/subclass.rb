#!/usr/bin/env ruby

class A
  @@value = 1
  def A.value
    @@value
  end

  def b
    @data = "ricol"
    puts @data
  end

  def c
    puts @data
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

puts A.value

a = A.new
a.b
a.c
