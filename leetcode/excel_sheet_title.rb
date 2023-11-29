#!/usr/bin/env ruby

# @param {Integer} column_number
# @return {String}
def convert_to_title(column_number)
  alpha = ("A".."Z").to_a
  data = []
  x = column_number
  while x > 0
    r = (x - 1) % 26
    data << alpha[r]
    x = (x - 1) / 26
  end
  return data.join.reverse
end

for k, v in { 1 => "A", 28 => "AB", 701 => "ZY", 2147483647 => "FXSHRXW" }
  r = convert_to_title(k)
  puts "input: #{k}, answer: #{v}, mine: #{r} -> #{v == r ? "pass" : "fail"}"
end

def convert_to_int(value)
  hash = {}
  i = 1
  ("A".."Z").each do |c|
    hash[c] = i
    i += 1
  end

  r = 0
  value.reverse.chars.each_with_index do |c, index|
    r += hash[c] * (26 ** index)
  end
  return r
end

for k, v in { "A" => 1, "AB" => 28, "ZY" => 701, "FXSHRXW" => 2147483647 }
  r = convert_to_int(k)
  puts "input: #{k}, answer: #{v}, mine: #{r} -> #{v == r ? "pass" : "fail"}"
end
