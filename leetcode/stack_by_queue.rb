#!/usr/bin/env ruby

class MyStack
  class Queue
    def initialize()
      @data = []
    end

    def enqueue(data)
      @data << data
    end

    def dequeue()
      return @data.delete_at(0)
    end

    def is_empty?()
      return @data.empty?
    end

    def size()
      return @data.size
    end

    def show()
      p @data
    end
  end

  def initialize()
    @queue = Queue.new()
  end

=begin
    :type x: Integer
    :rtype: Void
=end
  def push(x)
    @queue.enqueue(x)
  end

=begin
    :rtype: Integer
=end
  def pop()
    value = nil
    size = @queue.size
    count = 0
    loop do
      value = @queue.dequeue
      count += 1
      if count < size
        @queue.enqueue(value)
      else
        break
      end
    end
    value
  end

=begin
    :rtype: Integer
=end
  def top()
    value = nil
    size = @queue.size
    count = 0
    loop do
      value = @queue.dequeue
      count += 1
      @queue.enqueue(value)
      break if count == size
    end
    value
  end

=begin
    :rtype: Boolean
=end
  def empty()
    @queue.is_empty?
  end
end

p "testing queue..."
q = MyStack::Queue.new()
q.enqueue(1)
q.show
q.enqueue(2)
q.enqueue(3)
q.show
q.dequeue
q.show
q.dequeue
q.show
q.dequeue
q.show
q.dequeue
q.show
q.enqueue(1)
q.show
q.enqueue(2)
q.enqueue(3)
q.show
q.dequeue
q.show

p "testing stack..."
# Your MyStack object will be instantiated and called as such:
obj = MyStack.new()
obj.push(1)
obj.push(2)
obj.push(3)
obj.push(4)
p obj.top
obj.pop
p obj.top
obj.pop
p obj.top
