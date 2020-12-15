#!/usr/bin/env ruby

hash = { 1 => "ricolwang", 2 => "wangxinghe" }

def printHash(hash)
  hash.each do |key, value|
    puts "key: #{key} value: #{value}"
  end
end

printHash(hash)

hash[3] = "qianchunyan"

printHash(hash)

hash["ricol"] = 31

printHash(hash)

hash["wang"] = "ricolwang"

printHash(hash)

hash["4"] = "valuefor'4'"

printHash(hash)

numbers = { "one" => 1, "two" => 2, "three" => 3 }
printHash(numbers)

numbers = { one: 10, two: 11, three: 12 }
printHash(numbers)

numbers = { one: 100, two: 101, three: 102 }
printHash(numbers)

a = {}
printHash(a)
a = { one: 1, two: 2, three: 3 }
printHash(a)

puts [0, 0, 0].hash
puts [0, 0, 0, 0].hash
