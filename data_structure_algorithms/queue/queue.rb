#!/usr/bin/env ruby

class Queue
  def initialize
    @items = []
  end

  def enqueue(v)
    out = @items << v
    out
  end

  def peek
    out == @items.frist
  end

  def dequeue
    out = @items.shift
    out
  end
end

def is_palindrome(v)
  t = v.split(//)
  q = Queue.new
  s = []

  t.each do |x|
    q.enqueue(x)
    s.push(x)
  end

  while s.count > 0
    left = q.dequeue
    right = s.pop
    return false if left != right
  end

  true
end

s = "refer"
puts "is_palindrome(#{s}) = #{is_palindrome(s)}"
s = "hello"
puts "is_palindrome(#{s}) = #{is_palindrome(s)}"
