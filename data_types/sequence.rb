#!/usr/bin/env ruby

class Sequence
  def initialize(from, to, by)
    @from = from
    @to = to
    @by = by
  end

  def each
    x = @from
    while x <= @to
      yield x
      x += @by
    end
  end

  def length
    return 0 if @from > @to
    Integer((@to - @from) / @by) + 1
  end

  alias size length

  def [](index)
    return nil if index < 0
    v = @from + index * @by
    v if v <= @to
  end

  def *(factor)
    Sequence.new(@from * factor, @to * factor, @by * factor)
  end

  def +(offset)
    Sequence.new(@from + offset, @to + offset, @by)
  end

  def printInfor
    each { |x| print x, " " }
  end
end

s = Sequence.new(1, 10, 2)
s.each { |x| print x, " " }
for x in s
  puts x
end
puts ""
puts s[s.size - 1]
t = (s + 1) * 2
t.printInfor
puts ""
