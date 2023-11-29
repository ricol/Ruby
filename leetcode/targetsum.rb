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
# @param {Integer} target_sum
# @return {Boolean}
def has_path_sum(root, target_sum)
  return false if root.nil?

  if root.left.nil? and root.right.nil?
    return root.val == target_sum
  else
    return true if !root.right.nil? and has_path_sum(root.right, target_sum - root.val)
    return true if !root.left.nil? and has_path_sum(root.left, target_sum - root.val)
  end

  return false
end

r = TreeNode.new(5)
r.left = TreeNode.new(4)
r.right = TreeNode.new(8)
r.left.left = TreeNode.new(11)
r.left.left.left = TreeNode.new(7)
r.left.left.right = TreeNode.new(2)
r.right.left = TreeNode.new(13)
r.right.right = TreeNode.new(4)
r.right.right.right = TreeNode.new(1)

for k, v in { 22 => true, 1 => false, 5 => false, 10 => false }
  my = has_path_sum(r, k)
  puts "input: #{k}, answer: #{v}, my result: #{my}, -> #{v == my ? "pass" : "fail"}"
end

r = TreeNode.new(1)
r.left = TreeNode.new(2)
r.right = TreeNode.new(3)

for k, v in { 5 => false, 3 => true, 4 => true, 6 => false }
  my = has_path_sum(r, k)
  puts "input: #{k}, answer: #{v}, my result: #{my}, -> #{v == my ? "pass" : "fail"}"
end

r = TreeNode.new(1)
r.left = TreeNode.new(2)

for k, v in { 5 => false, 3 => true, 4 => false, 6 => false }
  my = has_path_sum(r, k)
  puts "input: #{k}, answer: #{v}, my result: #{my}, -> #{v == my ? "pass" : "fail"}"
end
