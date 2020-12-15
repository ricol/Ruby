#!/usr/bin/env ruby

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
