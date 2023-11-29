#!/usr/bin/env ruby

require "./gameCharacter"
gc = GameCharacter.new(120, "Magician", %w[spells invisibility])
puts "power: #{gc.power}\ntype: #{gc.type}"
puts "weapons: "
gc.weapons.each do |w|
  puts w
end
File.open("game", "w+") do |f|
  Marshal.dump(gc, f)
end
