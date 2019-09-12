#!/usr/local/bin/ruby

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
["#!/usr/local/bin/ruby\n", "\n", "# PI = 4 * (1 / 1 - 1 / 3 + 1 / 5 - 1 / 7 + ...)\n", "\n", "class String\n", "\n", "\tdef +(n)\n", "\t\tr = \"\"\n", "\t\tif n.size > self.size\n", "\t\t\tmax, min, remaining = n.size - 1, self.size - 1, n\n", "\t\telse\n", "\t\t\tmax, min, remaining = self.size - 1, n.size - 1, self\n", "\t\tend\n", "\t\tincrement = 0\n", "\n", "\t\tfor i in 0.step(min)\n", "\t\t\tx = self[self.size - i - 1]\n", "\t\t\ty = n[n.size - i - 1]\n", "\t\t\tz = x.to_i + y.to_i + increment\n", "\t\t\tincrement = 0\n", "\t\t\tif z >= 10\n", "\t\t\t\tz %= 10\n", "\t\t\t\tincrement = 1\n", "\t\t\tend\n", "\t\t\tr = \"\#{z.to_s}\#{r}\"\n", "\n", "\t\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\t\tend\n", "\n", "\t\tfor i in (min + 1).step(max)\n", "\t\t\tx = remaining[remaining.size - i - 1]\n", "\t\t\tz = x.to_i + increment\n", "\t\t\tincrement = 0\n", "\t\t\tif z >= 10\n", "\t\t\t\tz %= 10\n", "\t\t\t\tincrement = 1\n", "\t\t\tend\n", "\t\t\tr = \"\#{z.to_s}\#{r}\"\n", "\t\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\t\tend\n", "\n", "\t\tif increment > 0\n", "\t\t\tr = \"\#{increment.to_s}\#{r}\"\n", "\t\tend\n", "\n", "\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\n", "\t\treturn r\n", "\tend\n", "\n", "end\n", "\n", "class BigFloat\n", "\tattr_writer :integer, :decimal\n", "\tattr_reader :integer, :decimal\n", "\n", "\tdef initialize()\n", "\t\t@integer = \"\"\n", "\t\t@decimal = \"\"\n", "\tend\n", "\n", "\tdef to_s\n", "\t\t\"\#{@integer}.\#{@decimal}\"\n", "\tend\n", "\n", "\tdef +(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer + n.integer\n", "\t\tr.decimal = @decimal + n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef -(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer - n.integer\n", "\t\tr.decimal = @decimal - n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef *(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer * n.integer\n", "\t\tr.decimal = @decimal * n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef /(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer / n.integer\n", "\t\tr.decimal = @decimal / n.decimal\n", "\t\treturn r\n", "\tend\n", "end\n", "\n", "def pi(n)\n", "  i = 0\n", "  num = 1.0\n", "  sum = 0\n", "  while i < n\n", "    sum += (-1) ** i * (1.0 / num)\n", "    i += 1\n", "    num += 2\n", "  end\n", "  sum * 4\n", "end\n", "\n", "puts \"123123\" + \"5123123\"\n", "puts \"12312413123\" + \"541234123123123123\"\n"]["#!/usr/local/bin/ruby\n", "\n", "# PI = 4 * (1 / 1 - 1 / 3 + 1 / 5 - 1 / 7 + ...)\n", "\n", "class String\n", "\n", "\tdef +(n)\n", "\t\tr = \"\"\n", "\t\tif n.size > self.size\n", "\t\t\tmax, min, remaining = n.size - 1, self.size - 1, n\n", "\t\telse\n", "\t\t\tmax, min, remaining = self.size - 1, n.size - 1, self\n", "\t\tend\n", "\t\tincrement = 0\n", "\n", "\t\tfor i in 0.step(min)\n", "\t\t\tx = self[self.size - i - 1]\n", "\t\t\ty = n[n.size - i - 1]\n", "\t\t\tz = x.to_i + y.to_i + increment\n", "\t\t\tincrement = 0\n", "\t\t\tif z >= 10\n", "\t\t\t\tz %= 10\n", "\t\t\t\tincrement = 1\n", "\t\t\tend\n", "\t\t\tr = \"\#{z.to_s}\#{r}\"\n", "\n", "\t\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\t\tend\n", "\n", "\t\tfor i in (min + 1).step(max)\n", "\t\t\tx = remaining[remaining.size - i - 1]\n", "\t\t\tz = x.to_i + increment\n", "\t\t\tincrement = 0\n", "\t\t\tif z >= 10\n", "\t\t\t\tz %= 10\n", "\t\t\t\tincrement = 1\n", "\t\t\tend\n", "\t\t\tr = \"\#{z.to_s}\#{r}\"\n", "\t\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\t\tend\n", "\n", "\t\tif increment > 0\n", "\t\t\tr = \"\#{increment.to_s}\#{r}\"\n", "\t\tend\n", "\n", "\t\t# puts \"\#{i}: \#{x} + \#{y} = \#{z} with \#{increment} -> \#{r}\"\n", "\n", "\t\treturn r\n", "\tend\n", "\n", "end\n", "\n", "class BigFloat\n", "\tattr_writer :integer, :decimal\n", "\tattr_reader :integer, :decimal\n", "\n", "\tdef initialize()\n", "\t\t@integer = \"\"\n", "\t\t@decimal = \"\"\n", "\tend\n", "\n", "\tdef to_s\n", "\t\t\"\#{@integer}.\#{@decimal}\"\n", "\tend\n", "\n", "\tdef +(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer + n.integer\n", "\t\tr.decimal = @decimal + n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef -(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer - n.integer\n", "\t\tr.decimal = @decimal - n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef *(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer * n.integer\n", "\t\tr.decimal = @decimal * n.decimal\n", "\t\treturn r\n", "\tend\n", "\n", "\tdef /(n)\n", "\t\treturn nil if n.class != BigFloat\n", "\t\tr = BigFloat.new\n", "\t\tr.integer = @integer / n.integer\n", "\t\tr.decimal = @decimal / n.decimal\n", "\t\treturn r\n", "\tend\n", "end\n", "\n", "def pi(n)\n", "  i = 0\n", "  num = 1.0\n", "  sum = 0\n", "  while i < n\n", "    sum += (-1) ** i * (1.0 / num)\n", "    i += 1\n", "    num += 2\n", "  end\n", "  sum * 4\n", "end\n", "\n", "puts \"123123\" + \"5123123\"\n", "puts \"12312413123\" + \"541234123123123123\"\n", "[\"#!/usr/local/bin/ruby\\n\", \"\\n\", \"# PI = 4 * (1 / 1 - 1 / 3 + 1 / 5 - 1 / 7 + ...)\\n\", \"\\n\", \"class String\\n\", \"\\n\", \"\\tdef +(n)\\n\", \"\\t\\tr = \\\"\\\"\\n\", \"\\t\\tif n.size > self.size\\n\", \"\\t\\t\\tmax, min, remaining = n.size - 1, self.size - 1, n\\n\", \"\\t\\telse\\n\", \"\\t\\t\\tmax, min, remaining = self.size - 1, n.size - 1, self\\n\", \"\\t\\tend\\n\", \"\\t\\tincrement = 0\\n\", \"\\n\", \"\\t\\tfor i in 0.step(min)\\n\", \"\\t\\t\\tx = self[self.size - i - 1]\\n\", \"\\t\\t\\ty = n[n.size - i - 1]\\n\", \"\\t\\t\\tz = x.to_i + y.to_i + increment\\n\", \"\\t\\t\\tincrement = 0\\n\", \"\\t\\t\\tif z >= 10\\n\", \"\\t\\t\\t\\tz %= 10\\n\", \"\\t\\t\\t\\tincrement = 1\\n\", \"\\t\\t\\tend\\n\", \"\\t\\t\\tr = \\\"\\\#{z.to_s}\\\#{r}\\\"\\n\", \"\\n\", \"\\t\\t\\t# puts \\\"\\\#{i}: \\\#{x} + \\\#{y} = \\\#{z} with \\\#{increment} -> \\\#{r}\\\"\\n\", \"\\t\\tend\\n\", \"\\n\", \"\\t\\tfor i in (min + 1).step(max)\\n\", \"\\t\\t\\tx = remaining[remaining.size - i - 1]\\n\", \"\\t\\t\\tz = x.to_i + increment\\n\", \"\\t\\t\\tincrement = 0\\n\", \"\\t\\t\\tif z >= 10\\n\", \"\\t\\t\\t\\tz %= 10\\n\", \"\\t\\t\\t\\tincrement = 1\\n\", \"\\t\\t\\tend\\n\", \"\\t\\t\\tr = \\\"\\\#{z.to_s}\\\#{r}\\\"\\n\", \"\\t\\t\\t# puts \\\"\\\#{i}: \\\#{x} + \\\#{y} = \\\#{z} with \\\#{increment} -> \\\#{r}\\\"\\n\", \"\\t\\tend\\n\", \"\\n\", \"\\t\\tif increment > 0\\n\", \"\\t\\t\\tr = \\\"\\\#{increment.to_s}\\\#{r}\\\"\\n\", \"\\t\\tend\\n\", \"\\n\", \"\\t\\t# puts \\\"\\\#{i}: \\\#{x} + \\\#{y} = \\\#{z} with \\\#{increment} -> \\\#{r}\\\"\\n\", \"\\n\", \"\\t\\treturn r\\n\", \"\\tend\\n\", \"\\n\", \"end\\n\", \"\\n\", \"class BigFloat\\n\", \"\\tattr_writer :integer, :decimal\\n\", \"\\tattr_reader :integer, :decimal\\n\", \"\\n\", \"\\tdef initialize()\\n\", \"\\t\\t@integer = \\\"\\\"\\n\", \"\\t\\t@decimal = \\\"\\\"\\n\", \"\\tend\\n\", \"\\n\", \"\\tdef to_s\\n\", \"\\t\\t\\\"\\\#{@integer}.\\\#{@decimal}\\\"\\n\", \"\\tend\\n\", \"\\n\", \"\\tdef +(n)\\n\", \"\\t\\treturn nil if n.class != BigFloat\\n\", \"\\t\\tr = BigFloat.new\\n\", \"\\t\\tr.integer = @integer + n.integer\\n\", \"\\t\\tr.decimal = @decimal + n.decimal\\n\", \"\\t\\treturn r\\n\", \"\\tend\\n\", \"\\n\", \"\\tdef -(n)\\n\", \"\\t\\treturn nil if n.class != BigFloat\\n\", \"\\t\\tr = BigFloat.new\\n\", \"\\t\\tr.integer = @integer - n.integer\\n\", \"\\t\\tr.decimal = @decimal - n.decimal\\n\", \"\\t\\treturn r\\n\", \"\\tend\\n\", \"\\n\", \"\\tdef *(n)\\n\", \"\\t\\treturn nil if n.class != BigFloat\\n\", \"\\t\\tr = BigFloat.new\\n\", \"\\t\\tr.integer = @integer * n.integer\\n\", \"\\t\\tr.decimal = @decimal * n.decimal\\n\", \"\\t\\treturn r\\n\", \"\\tend\\n\", \"\\n\", \"\\tdef /(n)\\n\", \"\\t\\treturn nil if n.class != BigFloat\\n\", \"\\t\\tr = BigFloat.new\\n\", \"\\t\\tr.integer = @integer / n.integer\\n\", \"\\t\\tr.decimal = @decimal / n.decimal\\n\", \"\\t\\treturn r\\n\", \"\\tend\\n\", \"end\\n\", \"\\n\", \"def pi(n)\\n\", \"  i = 0\\n\", \"  num = 1.0\\n\", \"  sum = 0\\n\", \"  while i < n\\n\", \"    sum += (-1) ** i * (1.0 / num)\\n\", \"    i += 1\\n\", \"    num += 2\\n\", \"  end\\n\", \"  sum * 4\\n\", \"end\\n\", \"\\n\", \"puts \\\"123123\\\" + \\\"5123123\\\"\\n\", \"puts \\\"12312413123\\\" + \\\"541234123123123123\\\"\\n\"]"]
