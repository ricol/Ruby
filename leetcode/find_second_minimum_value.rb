#!/usr/bin/env ruby

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
# @return {Integer}
def find_second_minimum_value(root)
  $value = [root.val]
  def add(num)
    # puts "before... #{$value}"
    if $value.count == 1
      if $value.last < num
        $value << num
      end
    else
      if num < $value.last && num != $value.first
        $value[$value.count - 1] = num
      end
    end
    # puts "after #{$value}"
  end
  def min_value(r)
    add(r.val)
    v1 = min_value(r.left) if r.left
    v2 = min_value(r.right) if r.right
    add(v1) if v1
    add(v2) if v2
  end
  min_value(root)
  return $value.count == 1 ? -1 : ($value.last != $value.first ? $value.last : -1)
end

tree1 = TreeNode.new(2, TreeNode.new(2), TreeNode.new(5, TreeNode.new(5), TreeNode.new(7)))
tree2 = TreeNode.new(2, TreeNode.new(2), TreeNode.new(2))
tree3 = TreeNode.new(5, TreeNode.new(8), TreeNode.new(5))
for i, r in {tree1 => 5, tree2 => -1, tree3 => 8}
  a = find_second_minimum_value(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end