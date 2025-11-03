#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/lib/tree_node_lib"

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
def find_tilt(root)
  $hash = {}
  def value(r)
    return 0 if r.nil?
    return $hash[r] if !$hash[r].nil?
    v = r.val
    v += value(r.left) if !r.left.nil?
    v += value(r.right) if !r.right.nil?
    $hash[r] = v
    return v
  end
  def traverse(r)
    return if r.nil?
    left = r.left.nil? ? 0 : value(r.left)
    right = r.right.nil? ? 0 : value(r.right)
    r.val = left > right ? left - right : right - left
    traverse(r.left) if !r.left.nil?
    traverse(r.right) if !r.right.nil?
  end
  traverse(root)
  $value = 0
  def total(r)
    return if r.nil?
    $value += r.val
    total(r.left) if !r.left.nil?
    total(r.right) if !r.right.nil?
  end
  total(root)
  return $value  
end

for i, r in {[1,2,3] => 1, [4,2,9,3,5,nil,7] => 15, [21,7,14,1,1,2,2,3,3] => 9}
  a = find_tilt(TreeNode.buildTree(i))
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
