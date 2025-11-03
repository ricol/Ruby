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
def min_depth(root)
  $minimum = root.nil? ? 0 : 1e5
  $lvl = 0

  def go(r)
    return if r.nil?
    $lvl += 1
    if r.left.nil? and r.right.nil? and $lvl < $minimum
      $minimum = $lvl
    else
      go(r.left) if !r.left.nil?
      go(r.right) if !r.right.nil?
    end
    $lvl -= 1
  end

  go(root)
  return $minimum
end

r = TreeNode.new(3)
r.left = TreeNode.new(9)
r.right = TreeNode.new(20)
r.right.left = TreeNode.new(15)
r.right.right = TreeNode.new(7)

for k, v in { r => 2 }
  my = min_depth(k)
  puts "input: #{k}, answer: #{v}, my result: #{my}, -> #{v == my ? "pass" : "fail"}"
end
