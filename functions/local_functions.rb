#!/usr/bin/env ruby

def test(data, i, j)
  puts data[i][j]
  $d = data

  def show(ii, jj)
    puts $d[ii][jj]
  end

  show(1, 1)
end

a = [1, 2, 3, 4]
b = [5, 6, 7, 8]
c = [a, b]
test(c, 0, 0)
