#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/lib/normal_tree"

# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {int}
def maxDepth(root)
  $max = 0
  $level = 1
  def find(r)
    return if !r
    $max = $level if $level > $max
    for child in r.children || []
      $level += 1
      $max = $level if $level > $max
      find(child)
      $level -= 1
    end
  end
  find(root)
  $max
end

for i, r in {[3,9,20,nil,nil,15,7] => 3}
  a = maxDepth(NormalTreeNode.buildTree(i))
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
