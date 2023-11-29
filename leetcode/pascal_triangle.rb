#!/usr/bin/env ruby

# @param {Integer} num_rows
# @return {Integer[][]}

def generate(num_rows)
  $result = [[1]]

  def nextRow(data)
    r = [1]
    for i in 0...(data.count - 1)
      r << data[i] + data[i + 1]
    end
    r << 1
    return r
  end

  r = [1]
  (1...num_rows).each do |x|
    r = nextRow(r)
    $result << r
  end

  return $result
end

for i, r in { 1 => [[1]], 2 => [[1], [1, 1]], 3 => [[1], [1, 1], [1, 2, 1]], 4 => [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1]], 5 => [[1], [1, 1], [1, 2, 1], [1, 3, 3, 1], [1, 4, 6, 4, 1]] }
  result = generate(i)
  puts "input: #{i}, result: #{result} -> #{result == r}"
end
