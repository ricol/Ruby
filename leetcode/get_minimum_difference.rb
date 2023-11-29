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
def get_minimum_difference1(root)
  $minimum = 1e5
  def traverse(r)
    return if r.nil?
    return if r.left.nil? || r.right.nil?
    value = r.left.val > r.right.val ? r.left.val - r.right.val : r.right.val - r.left.val
    $minimum = value < $minimum ? value : $minimum
    traverse(r.left) if !r.left.nil?
    traverse(r.right) if !r.right.nil?
  end
  traverse(root)
  return $minimum
end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference2(root)
  $hash = {}
  $data = []
  def traverse(r)
    $data << r.val
    traverse(r.left) if r.left
    traverse(r.right) if r.right
  end
  def analyze(data)
    for i in 0...data.count
      for j in (i + 1)...data.count
        k = key(data[i], data[j])
        $hash[k] = abs(data[i], data[j]) if $hash[k].nil?
      end
    end
  end
  def key(a, b)
    return a > b ? "#{b}-#{a}" : "#{a}-#{b}"
  end
  def abs(a, b)
    return a > b ? a - b : b - a
  end
  traverse(root)
  analyze($data)
  return $hash.values.min
end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference3(root)
  $hash = {}
  $data = []
  def traverse(r)
    for i in $data 
      k = key(i, r.val)
      $hash[k] = abs(i, r.val) if $hash[k].nil?
    end
    $data << r.val
    traverse(r.left) if r.left
    traverse(r.right) if r.right
  end
  def key(a, b)
    return a > b ? "#{b}-#{a}" : "#{a}-#{b}"
  end
  def abs(a, b)
    return a > b ? a - b : b - a
  end
  traverse(root)
  return $hash.values.min
end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference4(root)
  $minimum = 1e5
  $data = []
  $hash = {}
  def traverse(r)
    for i in $data
      k = key(r.val, i)
      next if $hash[k]
      value = abs(r.val, i)
      $minimum = value if value < $minimum
      $hash[k] = true
      return $minimum if $minimum == 0
    end
    $data << r.val
    traverse(r.left) if r.left
    traverse(r.right) if r.right
  end
  def key(a, b)
    return a > b ? "#{b}-#{a}" : "#{a}-#{b}"
  end
  def abs(a, b)
    return a > b ? a - b : b - a
  end
  traverse(root)
  return $minimum
end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference(root)
  $minimum = 1e5
  $data = []
  $hash = {}
  def traverse(r)
    for i in $data
      k = key(r.val, i)
      next if $hash[k]
      value = abs(r.val, i)
      $minimum = value if value < $minimum
      $hash[k] = true
      return $minimum if $minimum == 0
    end
    $data << r.val
    traverse(r.left) if r.left
    traverse(r.right) if r.right
  end
  def key(a, b)
    return a > b ? "#{b}-#{a}" : "#{a}-#{b}"
  end
  def abs(a, b)
    return a > b ? a - b : b - a
  end
  traverse(root)
  return $minimum
end

for i, r in {[4,2,6,1,3] => 1, [1,0,48,nil,nil,12,49] => 1, [236,104,701,nil,227,nil,911] => 9}
  a = get_minimum_difference(TreeNode.buildTree(i))
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
