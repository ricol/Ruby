#!/usr/bin/env ruby

MAX = 10

class Matrix
  @rows = 0
  @columns = 0
  @data = Array.new(@rows) { Array.new(@columns) }

  attr :rows, :columns

  def initialize(rows, columns, random = false)
    @rows = rows
    @columns = columns
    @data = build_matrix(@rows, @columns, random)
  end

  private

  def build_matrix(rows, columns, random)
    data = Array.new(rows) { Array.new(columns) }
    for row in (0...rows)
      for column in (0...columns)
        data[row][column] = random ? rand(MAX) : 0
      end
    end
    return data
  end

  public

  def [](row)
    return @data[row]
  end

  def [](row, column)
    return @data[row][column]
  end

  def update(row, column, value)
    @data[row][column] = value
  end

  def show
    puts self
  end

  def is_square?
    return @rows == @columns
  end

  def calculate
    return nil if !is_square?
    result = 0
    for row in (0...@rows)
      for column in (0...@columns)
        result += @data[row][column] * (-1) ** (row + column)
      end
    end
    return result
  end

  def revert
    r = Matrix.new(@columns, @rows)
    for column in (0...@columns)
      for row in (0...@rows)
        r.update(column, row, self[row, column])
      end
    end
    return r
  end

  def is_same_size?(m)
    return m.rows == @rows && m.columns == @columns
  end

  def +(m)
    if is_same_size?(m)
      r = Matrix.new(@rows, @columns)
      for row in (0...@rows)
        for column in (0...@columns)
          r.update(row, column, @data[row][column] + m[row, column])
        end
      end
      return r
    end

    return nil
  end

  def -(m)
    return self + m.negative
  end

  def *(m)
    return nil if @columns != m.rows
    r = Matrix.new(@rows, m.columns)
    for row in (0...@rows)
      for column in (0...m.columns)
        value = 0
        for c in (0...@columns)
          value += @data[row][c] * m[c, column]
        end
        r.update(row, column, value)
      end
    end
    return r
  end

  def /(m)
  end

  def negative
    r = Matrix.new(@rows, @columns)
    for row in (0...@rows)
      for column in (0...@columns)
        r.update(row, column, -@data[row][column])
      end
    end
    return r
  end

  def to_s
    s = "-" * ((@columns * 4 - 3) / 2)
    s += "#{@rows}*#{@columns}"
    s += "-" * ((@columns * 4 - 3) / 2)
    s += "\n"
    for row in (0...@rows)
      for column in (0...@columns)
        s += sprintf("%.2f", @data[row][column]) + "\t"
      end
      s += "\n"
    end
    s += "-" * @columns * 4
    return s
  end

  #basic row operations

  def row_operate_swap(i, j)
    return false if i >= @rows || j >= @rows
    for column in (0...@columns)
      d = @data[i][column]
      @data[i][column] = @data[j][column]
      @data[j][column] = d
    end
    return true
  end

  def row_operate_multiply(row, num)
    return false if num == 0 || row >= @rows
    for column in (0...@columns)
      @data[row][column] *= num
    end
    return true
  end

  def row_operate_add(from, to, num = 1)
    return false if num == 0 || from >= @rows || to >= @rows
    for column in (0...@columns)
      @data[to][column] += @data[from][column] * num
    end
    return true
  end

  def normalize()
    for row in (0...@rows)
      for column in (0...@columns)
        next if @data[row][column] == 0
        break if @data[row][column] == 1
        data = @data[row][column]
        for c in (0...@columns)
          @data[row][c] /= data * 1.0
        end
        break
      end
    end
  end

  def swap
    zero_counts = []
    for row in (0...@rows)
      num = 0
      for column in (0...@columns)
        num += 1 if @data[row][column] == 0
        break
      end
      zero_counts << num
    end
    for row in (0...@rows - 1)
      for r in (row...@rows - 1)
        if zero_counts[r] > zero_counts[r + 1]
          self.row_operate_swap(r, r + 1)
          zero_counts[r], zero_counts[r + 1] = zero_counts[r + 1], zero_counts[r]
        end
      end
    end
  end

  def getRemainingMatrix(row, column)
    m_rows = @rows - 1
    m_columns = @columns - 1
    m = Matrix.new(m_rows, m_columns)
    m_r = 0
    m_c = 0
    for r in (0...@rows)
      next if r == row
      for c in (0...@columns)
        next if c == column
        # puts "r: #{r}, c: #{c}, data: #{@data[r][c]}"
        m.update(m_r, m_c, @data[r][c])
        # puts "-> m_r: #{m_r}, m_c: #{m_c}"
        m_c += 1
        if m_c >= m_columns
          m_c = 0
          m_r += 1
        end
      end
    end
    m
  end

  def getFirstNonZeroColumn(row)
    result = 0
    for c in (0...@columns)
      if @data[row][c] == 0
        result += 1
      else
        break
      end
    end
    return result
  end

  def minus(row)
    start_from_column = getFirstNonZeroColumn(row)

    for r in (0...@rows)
      next if r == row
      next if getFirstNonZeroColumn(r) < start_from_column
      self.row_operate_add(row, r, -1)
    end
  end

  def is_simplified?
    for r in (0...@rows)
      for c in (0...@columns)
        return false if @data[r][c] != 0 && c < r
        return false if @data[r][c] != 1
      end
    end
    return true
  end
end

m = Matrix.new(10, 12, true)
msg = "press to continue...('q' to exit)..."
row = 0
m.show
puts msg

while gets.chomp != "q" && !m.is_simplified? && row < m.rows
  puts "*" * 10 + "start" + "*" * 10
  puts "normalizing..."
  m.normalize()
  m.show
  puts "press any key to continue..."
  gets
  puts "minus...#{row}"
  m.minus(row)
  m.show
  puts "press any key to continue..."
  gets
  puts msg
end

# puts "#{m} is_simplified" if m.is_simplified?

# m1 = Matrix.new(rand(MAX) + 1, rand(MAX) + 1, true)
# puts "m1: \n#{m1}"
# m2 = Matrix.new(rand(MAX) + 1, rand(MAX) + 1, true)
# puts "m2: \n#{m2}"

# puts "m1 + m2 = "
# m = m1 + m2
# m.show if m
# puts "m1 - m2 = "
# m = m1 - m2
# m.show if m
# puts "m1 * m2 = "
# m = m1 * m2
# m.show if m
# m = Matrix.new(rand(MAX) + 1, rand(MAX) + 1, true)
# if m
# 	m.show
# 	row1 = rand(m.rows)
# 	row2 = rand(m.rows)
# 	puts "swap r#{row1} <-> r#{row2}..."
# 	m.row_operate_swap(row1, row2)
# 	m.show
# 	num = rand(MAX)
# 	puts "multiply #{num} to r#{row1}..."
# 	m.row_operate_multiply(row1, num)
# 	m.show
# 	puts "r#{row1} * #{num} add to r#{row2}..."
# 	m.row_operate_add(row1, row2, num)
# 	m.show
# end

# rows = 3
# columns = 3
# m = Matrix.new(rows, columns, true)
# m.show

# for r in (0...rows)
#   for c in (0...columns)
#     puts "-" * 10
#     puts "row: #{r}, column: #{c}"
#     m.getRemainingMatrix(r, c).show
#   end
# end
