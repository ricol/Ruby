#!/usr/bin/env ruby

# @param {Integer} m
# @param {Integer} n
# @param {Integer[][]} ops
# @return {Integer}
def max_count(m, n, ops)
  a = Array.new(m, 0)
  b = Array.new(n, 0)
  for op in ops
    for i in 0...op.first 
      a[i] += 1 
    end 
    for j in 0...op.last 
      b[j] += 1 
    end
  end
  x = 0
  for i in 0...a.size
    if a[i] == a[0]
      x += 1
    else
      break
    end
  end
  y = 0
  for i in 0...b.size
    if b[i] == b[0]
      y += 1
    else
      break
    end
  end
  x * y
end

for i, r in {[3, 3, [[2,2],[3,3]]] => 4,
[3, 3, [[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3],[2,2],[3,3],[3,3],[3,3]]] => 4,
[3, 3, []] => 9}
  a = max_count(i[0], i[1], i[2])
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
