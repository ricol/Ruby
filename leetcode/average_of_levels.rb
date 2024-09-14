#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/lib/tree_node_lib"

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
# @return {Float[]}
def average_of_levels(root)
  queue = []
  hash = {}
  hashCount = {}
  hashAve = {}
  sum = 0
  queue << [root, 0]
  while queue.count > 0
    node = queue.first
    r = node.first
    level = node.last
    if hashCount[level]
      hashCount[level] += 1
    else
      hashCount[level] = 1
    end
    if hash[level]
      hash[level] += r.val
    else
      hash[level] = r.val
    end
    hashAve[level] = hash[level] * 1.0 / hashCount[level]
    queue.delete_at(0)
    queue << [r.left, level + 1] if r.left
    queue << [r.right, level + 1] if r.right
  end
  answer = []
  hashAve.keys.sort.each do |k|
    answer << hashAve[k]
  end
  answer
end

for i, r in {[3,9,20,nil,nil,15,7] => [3.00000,14.50000,11.00000],
[3,9,20,15,7] => [3.00000,14.50000,11.00000]}
  a = average_of_levels(TreeNode.buildTree(i))
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"

end
