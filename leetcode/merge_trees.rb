#!/usr/bin/env ruby

# Definition for a binary tree node.

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {TreeNode}

require File.dirname(__FILE__) + "/lib/tree_node_lib"

def merge_trees(root1, root2)
  def merge(r1, r2)
    return nil if r1 == nil && r2 == nil
    return r1 if r2 == nil && r1 != nil
    return r2 if r1 == nil && r2 != nil
    r = TreeNode.new(r1.val + r2.val)
    r.left = merge(r1.left, r2.left)
    r.right = merge(r1.right, r2.right)
    return r
  end

  r = merge(root1, root2)
  return r
end

root1 = TreeNode.new(1, TreeNode.new(3, TreeNode.new(5)), TreeNode.new(2))
root2 = TreeNode.new(2, TreeNode.new(1, nil, TreeNode.new(4)), TreeNode.new(3, nil, TreeNode.new(7)))
result = TreeNode.new(3, TreeNode.new(4, TreeNode.new(5), TreeNode.new(4)), TreeNode.new(5, nil, TreeNode.new(7)))
myresult = merge_trees(root1, root2)
puts "#{myresult.equal?(result)}"
