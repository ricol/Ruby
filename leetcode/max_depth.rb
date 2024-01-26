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

for i, r in {}

end