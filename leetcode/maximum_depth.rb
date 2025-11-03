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
# @return {Integer}
def max_depth(root)
  $maximum = 0
  $lvl = 0

  def go(r)
    return if r.nil?
    $lvl += 1
    go(r.left) if !r.left.nil?
    go(r.right) if !r.right.nil?
    $maximum = $lvl if $lvl > $maximum
    $lvl -= 1
  end

  go(root)
  return $maximum
end

r1 = TreeNode.new(0)
r1.left = TreeNode.new(1)
r1.right = TreeNode.new(2)
r1.left.left = TreeNode.new(3)
r1.left.right = TreeNode.new(4)
r1.left.left.left = TreeNode.new(5)
r1.left.left.left.right = TreeNode.new(6)

puts "maximum depth of #{r1} is: #{max_depth(r1)}"
