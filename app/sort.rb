#!/usr/local/bin/ruby

#
person1 = {name: "Ricol Wang", age: 34, gender: "male"}
person2 = {name: "Jing Wang", age: 32, gender: "female"}
persons = [person1, person2]
puts persons

persons.sort! { |p1, p2| p1[:age] <=> p2[:age] }
puts persons
