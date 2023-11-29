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

# @param {TreeNode} p
# @param {TreeNode} q
# @return {Boolean}
def is_same_tree(p, q)
  return true if p.nil? and q.nil?
  return false if p.nil? and !q.nil?
  return false if !p.nil? and q.nil?

  return false if p.val != q.val
  return false if p.left.nil? and !q.left.nil?
  return false if !p.left.nil? and q.left.nil?
  return false if p.right.nil? and !q.right.nil?
  return false if !p.right.nil? and q.right.nil?
  return false if !p.left.nil? and !q.left.nil? and !is_same_tree(p.left, q.left)
  return false if !p.right.nil? and !q.right.nil? and !is_same_tree(p.right, q.right)

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
r2.left = TreeNode.new(1)
r2.right = TreeNode.new(2)
r2.left.left = TreeNode.new(3)
r2.left.right = TreeNode.new(4)
r2.left.left.left = TreeNode.new(5)
r2.left.left.left.right = TreeNode.new(6)

puts "#{r1}, #{r2} -> #{is_same_tree(r1, r2)}"
