#!/usr/bin/env ruby

# Definition for singly-linked list.
class ListNode
  attr_accessor :val, :next

  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

# @param {ListNode} head
# @param {Integer} n
# @return {ListNode}
def remove_nth_from_end(head, n)
  hash = {}
  h = head
  i = 0
  while h != nil
    hash[i] = h
    h = h.next
    i += 1
  end
  if i - n - 1 >= 0
    hash[i - n - 1].next = hash[i - n + 1]
    return head
  else
    return head.next
  end
end

head = ListNode.new(1, ListNode.new(2))
remove_nth_from_end(head, 1)
h = head
while h != nil
  puts "\t#{h.val}"
  h = h.next
end
