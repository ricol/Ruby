#!/usr/bin/env ruby

# Definition for a binary tree node.
require File.dirname(__FILE__) + "/lib/tree_node_lib"

class TreeNode
  attr_accessor :val, :left, :right

  def initialize(val = 0, left = nil, right = nil)
    @val = val
    @left = left
    @right = right
  end
end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  $paths = []
  $path = []

  def access(r)
    $path << r.val
    access(r.left) if r.left
    access(r.right) if r.right
    $paths << $path.join("->") if !r.left and !r.right
    $path.delete_at($path.count - 1)
  end

  access(root)
  return $paths
end

root = TreeNode.new(1, TreeNode.new(2, nil, TreeNode.new(5)), TreeNode.new(3))
for i, r in { root => ["1->2->5", "1->3"] }
  myresult = binary_tree_paths(i)
  puts "input: #{i} -> #{myresult} -> #{myresult == r ? "pass" : "fail"}"
end
