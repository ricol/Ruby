#!/usr/bin/env ruby

class Parent
  def altered()
    puts "PARENT altered()"
  end
end

class Child < Parent
  def altered()
    puts "CHILD, BEFORE PARENT altered()"
    super()
    puts "CHILD, AFTER PARENT altered()"
  end
end

dad = Parent.new()
son = Child.new()
dad.altered()
son.altered()

class Song
  def to_s
    "Song: #{@name} -- #{@artist} (#{@duration})"
  end
end

class Song
  attr_reader :name, :artist, :duration
  attr_writer :name, :artist

  def initialize(name, artist, duration)
    @name = name
    @artist = artist
    @duration = duration
    @count = 0
  end
end

class Song
  @@count = 0
  def Song.print
    puts "#{@@count}"
  end

  def addCount
    @count += 1
    @@count += 1
  end
end

class Song
  public

  def publicMethod1
    puts "public method1"
  end

  def publicMethod2
    puts "public method2"
  end

  protected

  def protectedMethod1
    puts "protectedMethod1"
  end

  def protectedMethod2
    puts "protectedMethod2"
  end

  private

  def privateMethod1
    puts "privateMethod1"
  end

  def privateMethod2
    puts "privateMethod2"
  end
end

aSong = Song.new("example", "A2", "1.00")
aSong.addCount
puts aSong.to_s
aSong = Song.new("take on me", "A1", "3.00")
aSong.addCount
puts aSong.to_s
puts aSong.name
puts aSong.artist
puts aSong.duration
aSong.name = "ricol wang"
puts aSong.name
aSong.artist = "qian chun yan"
puts aSong.artist
Song.print

aSong.publicMethod1
aSong.publicMethod2
