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
def is_balanced(root)
  return true if root.nil?
  $lvl = 0
  $max = 0

  def max_depth(r)
    return if r.nil?
    $lvl += 1
    $max = $lvl if $lvl > $max
    max_depth(r.left)
    max_depth(r.right)
    $lvl -= 1
  end

  max_depth(root.right)
  left_depth = $max
  $max = 0
  max_depth(root.left)
  right_depth = $max
  return false if (left_depth - right_depth).abs > 1
  return false if !is_balanced(root.left)
  return false if !is_balanced(root.right)
  return true
end

# [1,2,2,3,null,null,3,4,null,null,4]

r = TreeNode.new(3)
r.left = TreeNode.new(4)
r.right = TreeNode.new(5)
r.right.left = TreeNode.new(6)
r.right.right = TreeNode.new(7)

puts "checking #{r} -> #{is_balanced(r) == true ? "pass" : "fail"}"

r.right.left.right = TreeNode.new(1)

puts "checking #{r} -> #{is_balanced(r) == false ? "pass" : "fail"}"

r = TreeNode.new(1)
r.left = TreeNode.new(2)
r.right = TreeNode.new(2)
r.left.left = TreeNode.new(3)
r.right.right = TreeNode.new(3)
r.right.right.right = TreeNode.new(4)
r.left.left.left = TreeNode.new(4)

puts "checking #{r} -> #{is_balanced(r) == false ? "pass" : "fail"}"
