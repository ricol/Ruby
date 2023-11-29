#!/usr/bin/env ruby

Num = 10

class Node
  attr_writer :data, :next
  attr_reader :data, :next

  def initialize(num)
    @data = num
    @next = nil
  end

  def to_s
    "data: #{@data}"
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def <<(num)
    n = Node.new(num)
    if !@head
      @head = n
    else
      temp = @head
      while temp.next do temp = temp.next end
      temp.next = n
    end
  end

  def [](index)
    n = @head
    num = 0
    while n.next && (num < index)
      n = n.next
      num += 1
    end
    n
  end

  def []=(index, value)
    n = self[index]
    n.data = value
  end

  def length
    l = 1
    n = @head
    while n.next
      n = n.next
      l += 1
    end
    l
  end

  def to_s
    temp = @head

    while temp
      puts temp
      temp = temp.next
    end
  end

  def printInfor
    (0..(length - 1)).each do |i|
      puts "linkedlist[#{i}] = #{self[i]}"
    end
  end
end

puts "begin..."

l = LinkedList.new

Num.times do
  num = rand(Num)
  l << num
end

puts l.to_s

puts "l.length: #{l.length}"
l.printInfor
puts "after..."
10.times do
  l[rand(l.length)] = rand(l.length)
end
l.printInfor
puts "end."
