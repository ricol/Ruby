#!/usr/bin/env ruby

require "./gameCharacter.rb"
File.open("game") do |f|
  @gc = Marshal.load(f)
end
puts "power: #{@gc.power}\ntype: #{@gc.type}"
puts "weapons: "
@gc.weapons.each do |w|
  puts w
end
