#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/lib/tree_node_lib"

def sum_of_left_leaves(root)
  $sum = 0
  $parent = nil

  def go(r)
    if r.left
      $parent = r
      go(r.left)
    end
    if r.right
      $parent = r
      go(r.right)
    end
    if $parent and $parent.left = r and $parent.right != r and !r.left and !r.right
      puts(r.val)
      $sum += r.val
    end
  end

  go(root)
  return $sum
end

root1 = TreeNode.new(3, TreeNode.new(9), TreeNode.new(20, TreeNode.new(15), TreeNode.new(7)))
root2 = TreeNode.new(1)

for i, r in { root1 => 24, root2 => 0 }
  # i.mid_show do |x| print "#{x}\t" end
  # print("\n")
  myresult = sum_of_left_leaves(i)
  puts "input: #{i}, myresult: #{myresult}, correct result: #{r} -> #{myresult == r ? "pass" : "fail"}"
end
