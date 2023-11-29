#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/tree_node_lib"

root1 = TreeNode.new(1, TreeNode.new(3, TreeNode.new(5)), TreeNode.new(2))
root2 = TreeNode.new(2, TreeNode.new(1, nil, TreeNode.new(4)), TreeNode.new(3, nil, TreeNode.new(7)))
result = TreeNode.new(3, TreeNode.new(4, TreeNode.new(5), TreeNode.new(4)), TreeNode.new(5, nil, TreeNode.new(7)))
root1.show("-")
