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
def diameter_of_binary_tree(root)
  def getlevel(r)
    $level = 0
    $max = 0
    def check(r)
      return if !r
      $level += 1
      $max = $level if $level > $max
      if r.left
        check(r.left)
        $level -= 1
      end
      if r.right
        check(r.right)
        $level -= 1
      end
    end
    check(r)
    $max
  end
  $r = 0
  def go(r)
    v = getlevel(r.left) + getlevel(r.right)
    $r = v if v > $r
    go(r.left) if r.left
    go(r.right) if r.right
  end
  go(root)
  $r
end

for i, r in {[1,2,3,4,5] => 3, [1, 2] => 1, [3, 1, nil, nil, 2] => 2}
  a = diameter_of_binary_tree(TreeNode.buildTree(i))
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
