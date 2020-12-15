#!/usr/bin/env ruby

class Note
  attr :value

  def initialize(val)
    @value = val
  end

  def to_s
    @value.to_s
  end
end

class Chord
  def initialize(arr)
    @arr = arr
  end

  def play
    @arr.join("-")
  end
end

print "create object...\n"
c = Chord.new([Note.new("G"), Note.new("Bb"),
               Note.new("Db"), Note.new("E")])
print c.play + "\n"

print "saving...\n"
File.open("posterity", "w+") do |f|
  Marshal.dump(c, f)
end

print "loading...\n"
File.open("posterity") do |f|
  chord = Marshal.load(f)
  print chord.play + "\n"
end

print "Custom marshal process...\n"

class Special
  def initialize(valuable)
    @valuable = valuable
    @volatile = "Goodbye"
  end

  def _dump(depth)
    @valuable.to_str
  end

  def Special._load(str)
    result = Special.new(str)
  end

  def to_s
    "#{@valuable} and #{@volatile}"
  end
end

a = Special.new("Hello, World")
data = Marshal.dump(a)
obj = Marshal.load(data)
puts obj
