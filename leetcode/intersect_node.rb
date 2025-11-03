#!/usr/bin/env ruby

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} headA
# @param {ListNode} headB
# @return {ListNode}
def getIntersectionNode(headA, headB)
  hash = {}
  n = headA
  while n != nil
    hash[n] = true
    n = n.next
  end
  n = headB
  while n != nil
    return n if !hash[n].nil?
    n = n.next
  end
  return nil
end
