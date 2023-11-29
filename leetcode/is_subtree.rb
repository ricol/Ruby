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
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree_node(root, sub_root)
  $root = root
  $sub_root = sub_root
  def check(index, sub_root_index)
    return true if index >= $root.count && sub_root_index >= $sub_root.count
    return false if index >= $root.count && sub_root_index < $sub_root.count
    return false if index < $root.count && sub_root_index >= $sub_root.count
    if $root[index] == $sub_root[sub_root_index]
      return false if !check(index * 2 + 1, sub_root_index * 2 + 1)
      return false if !check(index * 2 + 2, sub_root_index * 2 + 2)
      return true
    end
    return false
  end
  for i in 0...root.count
    return true if check(i, 0)
  end
  return false
end

# @param {TreeNode} root
# @param {TreeNode} sub_root
# @return {Boolean}
def is_subtree(root, sub_root)
  def check(root, sub_root)
    return false if root && sub_root.nil?
    return false if root.nil? && sub_root
    return true if root.nil? && sub_root.nil?

    if root.val == sub_root.val
      return false if !check(root.left, sub_root.left)
      return false if !check(root.right, sub_root.right)
      return true
    end

    return false
  end
  $nodes = []
  def traverse(root)
    $nodes << root
    traverse(root.left) if !root.left.nil?
    traverse(root.right) if !root.right.nil?
  end
  traverse(root)
  for n in $nodes
    return true if check(n, sub_root)
  end
  return false
end

def to_array(node)
  data = []
  queue = [node]
  while !queue.empty?
    n = queue.first
    data << n.val
    queue.delete_at(0)
    queue << n.left if !n.left.nil?
    queue << n.right if !n.right.nil?
  end
  return data
end

for i, r in {[[3,4,5,1,2], [4,1,2]] => true, [[3,4,5,1,2,nil,nil,nil,nil,0], [4,1,2]] => false}
  a = is_subtree_node(i.first, i.last)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
