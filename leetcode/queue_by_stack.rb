#!/usr/bin/env ruby

class MyQueue
  class MyStack
    def initialize()
      @data = []
    end

    def push(data)
      @data << data
    end

    def pop()
      @data.delete_at(@data.size - 1)
    end

    def size
      @data.size
    end

    def empty?
      @data.size == 0
    end

    def show()
      p @data
    end
  end

  def initialize()
    @stack1 = MyStack.new()
    @stack2 = MyStack.new()
  end

=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @stack1.push(x)
  end

=begin
  :rtype: Integer
=end
  def pop()
    value = nil
    size = @stack1.size
    while size > 0
      value = @stack1.pop
      size -= 1
      @stack2.push(value) if size > 0
    end
    while !@stack2.empty?
      @stack1.push(@stack2.pop)
    end
    value
  end

=begin
  :rtype: Integer
=end
  def peek()
    value = nil
    size = @stack1.size
    while size > 0
      value = @stack1.pop
      size -= 1
      @stack2.push(value)
    end
    while !@stack2.empty?
      @stack1.push(@stack2.pop)
    end
    value
  end

=begin
  :rtype: Boolean
=end
  def empty()
    @stack1.size == 0
  end

  def show()
    @stack1.show()
  end
end

# Your MyQueue object will be instantiated and called as such:
q = MyQueue.new()
q.push(1)
q.show()
q.push(2)
q.show()
q.push(3)
q.show()
p q.peek()
q.show()
p q.peek()
q.show()
q.pop()
q.show()
q.push(3)
q.show()
p q.peek()
q.show()
q.push(4)
q.show()
q.pop
q.show()
q.pop
q.show()
q.pop
q.show()
p q.peek
q.show
q.pop
q.show
q.pop
q.show
