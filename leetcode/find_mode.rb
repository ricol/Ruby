#!/usr/bin/env ruby

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  $hash = Hash.new(0)
  def traverse(r)
    $hash[r.val] += 1
    traverse(r.left) if !r.left.nil?
    traverse(r.right) if !r.right.nil?
  end
  traverse(root)
  max = 0
  for k, v in $hash
    max = v if v > max
  end
  result = []
  for k, v in $hash
    result << k if max == v
  end
  result
end
