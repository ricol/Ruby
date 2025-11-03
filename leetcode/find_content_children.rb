#!/usr/bin/env ruby

# @param {Integer[]} g
# @param {Integer[]} s
# @return {Integer}
def find_content_children(g, s)
  g.sort!
  s.sort!
  i = 0
  j = 0
  while i < g.length and j < s.length
      if g[i] <= s[j]
          i += 1
      end
      j += 1
  end
  return i
end

for i, r in { [[1,2,3], [1,1]] => 1, [[1,2], [1,2,3]] => 2 }
    g, s = i
    result = find_content_children(g, s)
    puts "input: #{i}, expected result: #{r}, actual result:#{result} -> #{r == result ? 'pass' : 'fail'}"
end
