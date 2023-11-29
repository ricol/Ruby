#!/usr/bin/env ruby

# @param {Integer[][]} mat
# @param {Integer} r
# @param {Integer} c
# @return {Integer[][]}
def matrix_reshape(mat, r, c)
  return mat if r * c != mat.count * mat[0].count
  data = Array.new(r) { Array.new(c, 0) }
  ii = 0
  jj = 0
  for i in 0...(mat.count)
    for j in 0...(mat[0].count)
      data[ii][jj] = mat[i][j]
      jj += 1
      if jj >= c 
        jj = 0
        ii += 1
      end
    end
  end
  return data
end

for i, r in {[[[1,2],[3,4]], 1, 4] => [[1,2,3,4]], [[[1,2],[3,4]], 2, 4] => [[1,2],[3,4]], [[[1,2],[3,4]], 4, 1] => [[1],[2],[3],[4]]}
  a = matrix_reshape(i[0], i[1], i[2])
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
