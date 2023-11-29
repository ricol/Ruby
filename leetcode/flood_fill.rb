#!/usr/bin/env ruby

# @param {Integer[][]} image
# @param {Integer} sr
# @param {Integer} sc
# @param {Integer} new_color
# @return {Integer[][]}
def flood_fill(image, sr, sc, new_color)
  $data = Array.new(image.count) { Array.new(image[0].count, 0) }
  $image = image
  $new_color = new_color
  $original_color = image[sr][sc]

  def fill(row, col)
    return if row < 0 || row >= $image.count || col < 0 || col >= $image[0].count || $image[row][col] != $original_color || $data[row][col] == 1
    $data[row][col] = 1
    $image[row][col] = $new_color
    fill(row + 1, col)
    fill(row - 1, col)
    fill(row, col + 1)
    fill(row, col - 1)
  end

  fill(sr, sc)
  return $image
end

for input, result in { [[[0, 0, 0], [0, 1, 1]], 1, 1, 1] => [[0, 0, 0], [0, 1, 1]], [[[1, 1, 1], [1, 1, 0], [1, 0, 1]], 1, 1, 2] => [[2, 2, 2], [2, 2, 0], [2, 0, 1]], [[[0, 0, 0], [0, 0, 0]], 0, 0, 2] => [[2, 2, 2], [2, 2, 2]] }
  data = input.first
  original = Array.new(data.count) { Array.new(data[0].count) }
  for i in 0...data.count
    for j in 0...data[i].count
      original[i][j] = data[i][j]
    end
  end
  flood_fill(data, input[1], input[2], input.last)
  puts "input: #{original}, from: #{input[1]}, #{input[2]}, color: #{input.last}, \nmy result: #{data}, result: #{result} -> #{data == result ? "pass" : "fail"}"
end
