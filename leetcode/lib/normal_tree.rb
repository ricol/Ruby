#!/usr/bin/env ruby

class NormalTreeNode
  attr_accessor :val, :children

  def initialize(val = 0, children = [])
    @val = val
    @children = children
  end

  def pre_show(&block)
    def p_show(&block)
      yield(@val) if block_given?
      for c in @children
        c.p_show(&block)
      end
    end

    p_show(&block)
  end

  def after_show(&block)
    def a_show(&block)
      for c in @children
        c.a_show(&block)
      end
      yield(@val) if block_given?
    end

    a_show(&block)
  end

  def top_bottom
    queue = Queue.new()
    queue << self
    while !queue.empty?
      t = queue.deq
      yield(t.val) if block_given?
      for c in @children
        queue << c
      end
    end
    return queue
  end

  def show(space)
    queue = top_bottom
    $display = ""
    $MAX = 10
    $left = 0
    $right = 0
    $space = space

    def echo(node)
      $display += $space * $left + "#{node.val}" + $space * $right
    end

    echo(self)
    puts $display
  end

  def equal?(node)
    return false if node == nil
    return false if node.val != @val
    return false if node.children.size != @children.size
    @children.each_with_index do |child, index|
      return false if !child.queal?(node.children[index])
    end
    return true
  end

  def self.buildTree(data, i = 0)
    r = nil
    return r if data[i].nil?
    if i < data.size
      r = NormalTreeNode.new(data[i])
      r.left = NormalTreeNode(data, 2 * i + 1)
      r.right = NormalTreeNode(data, 2 * i + 2)
    end
    return r
  end

  def to_array()
    data = []
    queue = [self]
    while !queue.empty?
      n = queue.first
      data << n.val
      queue.delete_at(0)
      for c in @children
        queue << c
      end
    end
    return data
  end
end
