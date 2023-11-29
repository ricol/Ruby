#!/usr/bin/env ruby

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?

  def is_s(p, q)
    return true if p.nil? and q.nil?
    return false if p.nil? and !q.nil?
    return false if !p.nil? and q.nil?
    return false if p.val != q.val
    return false if !is_s(p.left, q.right)
    return false if !is_s(p.right, q.left)
    return true
  end

  return false if !is_s(root.left, root.right)
  return true
end

r1 = TreeNode.new(0)
r1.left = TreeNode.new(1)
r1.right = TreeNode.new(2)
r1.left.left = TreeNode.new(3)
r1.left.right = TreeNode.new(4)
r1.left.left.left = TreeNode.new(5)
r1.left.left.left.right = TreeNode.new(6)

r2 = TreeNode.new(0)
r2.right = TreeNode.new(1)
r2.left = TreeNode.new(2)
r2.right.left = TreeNode.new(4)
r2.right.right = TreeNode.new(3)
r2.right.right.right = TreeNode.new(5)
r2.right.right.right.left = TreeNode.new(6)

r = TreeNode.new(-1)
r.left = r1
r.right = r2

puts "#{r} is symmetric? #{is_symmetric(r)}"
