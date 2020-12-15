#!/usr/bin/env ruby

class MyClass
  def [](key)
    if key.kind_of?(Integer)
      @songs[key]
    else
      print "not an Integer."
    end
  end

  def initialize(array)
    @songs = array
  end
end

a = MyClass.new("a")
puts a[0]
a = MyClass.new(["abc", "ABC", "AbC", "aBc"])
puts a[2]
puts a["a"]
5.times do |x|
  puts "a[#{x}]=#{a[x]}"
end
