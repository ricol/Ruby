#!/usr/bin/env ruby

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val)
    @val = val
    @next = nil
  end
end

# @param {ListNode} head
# @return {Boolean}
def hasCycle(head)
  hash = {}
  h = head
  while !h.nil?
    hash[h].nil? ? hash[h] = true : (return true)
    h = h.next
  end
  return false
end

h = ListNode.new(1)
h.next = ListNode.new(2)
h.next.next = ListNode.new(3)
h.next.next.next = h

puts "#{h} has cycle -> #{hasCycle(h)}"
