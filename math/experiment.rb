#!/usr/bin/env ruby

# PI = 4 * (1 / 1 - 1 / 3 + 1 / 5 - 1 / 7 + ...)

class String
  def +(n)
    r = ""
    if n.size > self.size
      max, min, remaining = n.size - 1, self.size - 1, n
    else
      max, min, remaining = self.size - 1, n.size - 1, self
    end
    increment = 0

    for i in 0.step(min)
      x = self[self.size - i - 1]
      y = n[n.size - i - 1]
      z = x.to_i + y.to_i + increment
      increment = 0
      if z >= 10
        z %= 10
        increment = 1
      end
      r = "#{z.to_s}#{r}"

      # puts "#{i}: #{x} + #{y} = #{z} with #{increment} -> #{r}"
    end

    for i in (min + 1).step(max)
      x = remaining[remaining.size - i - 1]
      z = x.to_i + increment
      increment = 0
      if z >= 10
        z %= 10
        increment = 1
      end
      r = "#{z.to_s}#{r}"
      # puts "#{i}: #{x} + #{y} = #{z} with #{increment} -> #{r}"
    end

    if increment > 0
      r = "#{increment.to_s}#{r}"
    end

    # puts "#{i}: #{x} + #{y} = #{z} with #{increment} -> #{r}"

    return r
  end
end

class BigFloat
  attr_writer :integer, :decimal
  attr_reader :integer, :decimal

  def initialize()
    @integer = ""
    @decimal = ""
  end

  def to_s
    "#{@integer}.#{@decimal}"
  end

  def +(n)
    return nil if n.class != BigFloat
    r = BigFloat.new
    r.integer = @integer + n.integer
    r.decimal = @decimal + n.decimal
    return r
  end

  def -(n)
    return nil if n.class != BigFloat
    r = BigFloat.new
    r.integer = @integer - n.integer
    r.decimal = @decimal - n.decimal
    return r
  end

  def *(n)
    return nil if n.class != BigFloat
    r = BigFloat.new
    r.integer = @integer * n.integer
    r.decimal = @decimal * n.decimal
    return r
  end

  def /(n)
    return nil if n.class != BigFloat
    r = BigFloat.new
    r.integer = @integer / n.integer
    r.decimal = @decimal / n.decimal
    return r
  end
end

def pi(n)
  i = 0
  num = 1.0
  sum = 0
  while i < n
    sum += (-1) ** i * (1.0 / num)
    i += 1
    num += 2
  end
  sum * 4
end

puts "123123" + "5123123"
puts "12312413123" + "541234123123123123"
puts "pi: #{pi(1e7)}"
