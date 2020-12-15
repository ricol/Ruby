#!/usr/bin/env ruby

class String
  def rotate(char)
    return nil unless match(char)
    return self if self[0] == char[0]
    chars = split(//)
    ([chars.pop] + chars).join("").rotate(char)
  end

  def rotate!(char)
    replace(rotate(char))
  end
end

s = "wangxinghe"
puts "s: #{s}"
char = "g"
puts "s.rotate(#{char}): #{s.rotate(char)}"
