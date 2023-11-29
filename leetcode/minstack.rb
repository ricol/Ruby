#!/usr/bin/env ruby

class MinStack

=begin
    initialize your data structure here.
=end
  def initialize()
    @min = nil
    @data = []
  end

=begin
    :type val: Integer
    :rtype: Void
=end
  def push(val)
    @data.push(val)
    @min = val if (!@min.nil? and @min > val) or @min.nil?
  end

=begin
    :rtype: Void
=end
  def pop()
    data = @data.pop
    @min = @data.min
  end

=begin
    :rtype: Integer
=end
  def top()
    return @data.last
  end

=begin
    :rtype: Integer
=end
  def get_min()
    return @min
  end
end

# Your MinStack object will be instantiated and called as such:
obj = MinStack.new()
val = 2
obj.push(val)
obj.pop()
param_3 = obj.top()
p param_3
param_4 = obj.get_min()
p param_4
