#!/usr/bin/env ruby

def reverse_bits(n)
  def parse(s)
    r = 0
    i = 0
    s.reverse.each do |c|
      r += (2 ** i) * c.to_i
      i += 1
    end
    return r
  end

  if n.kind_of?(String)
    return parse(n.reverse.strip.split(""))
  elsif n.kind_of?(Integer)
    s = sprintf("%032o", n)
    return parse(s.reverse.strip.split(""))
  else
    b = []
    x = n.to_i
    while x > 1
      a = x % 2
      b << a
      x = x >> 1
    end
    b << x
    return parse(b)
  end
end

for k, v in { 00000010100101000001111010011100 => 964176192, "00000010100101000001111010011100  " => 964176192, "00000010100101000001111010011100" => 964176192, "11111111111111111111111111111101" => 3221225471 }
  r = reverse_bits(k)
  puts "input: #{k}, answer: #{v}, mine: #{r}, -> #{r == v ? "pass" : "fail"}"
end
