#!/usr/local/bin/ruby

require "./trig"
require "./action"
require "./debug"

puts "demo..."

y = Trig.sin(Trig::PI / 4)
wrongdoing = Action.sin(Action::VERY_BAD)
puts "y: #{y}"
puts "wrongdoing: #{wrongdoing}"

class Phonograph < Debug1::Base
end

class EightTrack < Debug1::Base
end

ph = Phonograph.new("West End Blues")

et = EightTrack.new("Surrealistic Pillow")

puts ph.whoAmI?
puts et.whoAmI?
