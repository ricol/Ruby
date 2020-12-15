#!/usr/bin/env ruby

h = { "dog" => "canine", "cat" => "feline", "donkey" => "asinine", 12 => "dodecine" }
puts h.length  # 4
puts h["dog"]  # 'canine'
puts h
puts h[12]

people = Hash.new
people[:nickname] = "IndianGuru"
people[:language] = "Marathi"
people[:lastname] = "Talim"

puts people[:lastname] # Talim

h1 = { :nickname => "IndianGuru", :language => "Marathi", :lastname => "Talim" }
puts h1

h2 = { nickname: "IndianGuru", language: "Marathi", lastname: "Talim" }
puts h2

puts h1 == h2
puts h1.equal?(h2)
puts h1.object_id
puts h2.object_id

# hash = {1: 'one'} # will not work
hash = { 1 => "one" } # will work
puts hash
