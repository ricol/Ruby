#!/usr/bin/env ruby

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end

  def pre_show(&block)
    def p_show(&block)
      yield(@val) if block_given?
      @left.p_show(&block) if @left != nil
      @right.p_show(&block) if @right != nil
    end

    p_show(&block)
  end

  def after_show(&block)
    def a_show(&block)
      @left.a_show(&block) if @left != nil
      @right.a_show(&block) if @right != nil
      yield(@val) if block_given?
    end

    a_show(&block)
  end

  def mid_show(&block)
    def m_show(&block)
      @left.m_show(&block) if @left != nil
      yield(@val) if block_given?
      @right.m_show(&block) if @right != nil
    end

    m_show(&block)
  end

  def top_bottom
    queue = Queue.new()
    queue << self
    while !queue.empty?
      t = queue.deq
      yield(t.val) if block_given?
      queue << t.left if t.left != nil
      queue << t.right if t.right != nil
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
    return false if !@left.equal?(node.left) if @left != nil
    return false if !@right.equal?(node.right) if @right != nil
    return true
  end

  def self.buildTree(data, i = 0)
    r = nil
    return r if data[i].nil?
    if i < data.size
      r = TreeNode.new(data[i])
      r.left = buildTree(data, 2 * i + 1)
      r.right = buildTree(data, 2 * i + 2)
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
      queue << n.left if !n.left.nil?
      queue << n.right if !n.right.nil?
    end
    return data
  end
end

if __FILE__ == $0
  puts "building treenodes..."
  root1 = TreeNode.new(1, TreeNode.new(3, TreeNode.new(5)), TreeNode.new(2))
  root2 = TreeNode.new(2, TreeNode.new(1, nil, TreeNode.new(4)), TreeNode.new(3, nil, TreeNode.new(7)))
  root3 = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)), TreeNode.new(3, TreeNode.new(6), TreeNode.new(7)))
  root4 = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)), TreeNode.new(3, TreeNode.new(6), TreeNode.new(7)))
  root5 = TreeNode.new(1, TreeNode.new(2, TreeNode.new(4), TreeNode.new(5)), TreeNode.new(3, TreeNode.new(6), TreeNode.new(8)))
  result = TreeNode.new(3, TreeNode.new(4, TreeNode.new(5), TreeNode.new(4)), TreeNode.new(5, nil, TreeNode.new(7)))

  puts "testing pre_show..."
  root1.pre_show { |x| print("#{x}\t") }; puts
  puts "testing after_show..."
  root1.after_show { |x| print("#{x}\t") }; puts
  puts "testing mid_show..."
  root1.mid_show { |x| print("#{x}\t") }; puts

  puts "testing show..."
  root1.show("-")
  root1.top_bottom { |x| print("#{x}\t") }
  puts
  root2.top_bottom { |x| print("#{x}\t") }
  puts
  result.top_bottom { |x| print("#{x}\t") }
  puts
  root3.top_bottom { |x| print("#{x}\t") }
  puts
  root3.show("-")

  puts "testing equal?..."
  puts "root3 == root4 ? #{root3.equal?(root4)}"
  puts "root3 == root5 ? #{root3.equal?(root5)}"

  r = TreeNode.buildTree([1, 2, nil, nil, 3, 4, 5, nil, nil, 6])
  r.mid_show { |x| print("#{x}\t") }; puts
  puts r.to_array
end
