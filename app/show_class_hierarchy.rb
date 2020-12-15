#!/usr/bin/env ruby

class MyClass
end

class MyNewClass < MyClass
end

def print_class(*c)
  max = 0
  a = []
  c.each do |cc|
    s = "#{cc}: "
    class_c = cc.class
    loop do
      break if class_c.nil?
      s << format("%15s", class_c)
      class_c = class_c.superclass
      s << " < " if class_c
    end
    max = s.length if max < s.length
    a << s
  end
  b = []
  a.each do |s|
    new_s = s.rjust(max)
    b << new_s
  end
  b.each do |s|
    puts s
  end
end

print_class(1, 1.123, "l", "wangxinghe", "wangxinghe", true, false, nil, (1..10), MyClass.new, MyNewClass.new)
