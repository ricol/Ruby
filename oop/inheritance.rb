#!/usr/bin/env ruby

class A
  def setNumber(x)
    @x = x
  end

  def printInfor
    puts "A.x: #{@x}"
  end
end

class B < A
  def printInfor
    puts "B.x: #{@x}"
  end
end

a = A.new
a.setNumber(1)
a.printInfor

b = B.new
b.setNumber(2)
b.printInfor
