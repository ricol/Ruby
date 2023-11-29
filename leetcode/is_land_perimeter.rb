#!/usr/bin/env ruby

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  $grid = grid
  $max_x = grid.count - 1
  $max_y = grid.first.count - 1
  $visisted = {}
  $perimeter = 0

  def visit(x, y)
    return if x < 0 || x > $max_x || y < 0 || y > $max_y
    return if $grid[x][y] != 1
    if $visisted[:"#{x}-#{y}"]
      $perimeter -= 1
      return
    end
	  $perimeter += 4
    $visisted[:"#{x}-#{y}"] = true
    for (i, j) in [[x, y - 1], [x - 1, y], [x + 1, y], [x, y + 1]]
      visit(i, j)
    end
  end

  for x in 0..$max_x
    for y in 0..$max_y
      if grid[x][y] == 1
        visit(x, y)
      end
    end
  end

  return $perimeter
end

for i, r in {[[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]] => 16, [[1]] => 4, [[1, 0]] => 4, [[1,1],[1,1]] => 8}
  result = island_perimeter(i)
  puts "input: #{i}, expected result: #{r}, actual result:#{result} -> #{r == result ? 'pass' : 'fail'}"
end
