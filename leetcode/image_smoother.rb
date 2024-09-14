#!/usr/bin/env ruby

# @param {Integer[][]} img
# @return {Integer[][]}
def image_smoother(img)
  result = Array.new(img.count) { Array.new(img[0].count) }
  i, j = 0, 0
  rows = img.count
  columns = img[0].count
  while i < rows
    while j < columns
      count = 0
      total = 0
      if i - 1 >= 0
        if  j - 1 >= 0
          total += img[i - 1][j - 1] 
          count += 1
        end
        if j < columns
          total += img[i - 1][j]
          count += 1
        end
        if j + 1 < columns
          total += img[i - 1][j + 1]
          count += 1
        end
      end
      if i < rows
        if  j - 1 >= 0
          total += img[i][j - 1] 
          count += 1
        end
        if j < columns
          total += img[i][j]
          count += 1
        end
        if j + 1 < columns
          total += img[i][j + 1]
          count += 1
        end
      end
      if i + 1 < rows
        if  j - 1 >= 0
          total += img[i + 1][j - 1] 
          count += 1
        end
        if j < columns
          total += img[i + 1][j]
          count += 1
        end
        if j + 1 < columns
          total += img[i + 1][j + 1]
          count += 1
        end
      end
      result[i][j] = total / count
      j += 1
    end
    i += 1
    j = 0
  end
  return result    
end

for i, r in {
  [[1,1,1],[1,0,1],[1,1,1]] => [[0,0,0],[0,0,0],[0,0,0]],
  [[100,200,100],[200,50,200],[100,200,100]] => [[137,141,137],[141,138,141],[137,141,137]]}
  a = image_smoother(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
