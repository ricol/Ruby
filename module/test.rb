#!/usr/bin/env ruby

require "./trig"
require "./action"
require "./debug"

puts "demo..."

y = Trig.sin(Trig::PI / 4)
wrongdoing = Action.sin(Action::VERY_BAD)
puts "y: #{y}"
puts "wrongdoing: #{wrongdoing}"

class Phonograph
  include Debug

  def initialize(name)
    @name = name
  end
end

class EightTrack
  include Debug1

  def initialize(name)
    @name = name
  end
end

ph = Phonograph.new("West End Blues")

et = EightTrack.new("Surrealistic Pillow")

puts ph.who_am_i
puts et.who_am_i
puts "end"
