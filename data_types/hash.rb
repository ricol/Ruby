#!/usr/bin/env ruby

numbers = Hash.new
p numbers
numbers["one"] = 1
numbers["two"] = 2
numbers["three"] = 3
numbers.each { |k, v| p "#{k}, #{k.class} -> #{v}" }
p numbers
numbers = { "one" => 1, "two" => 2, "three" => 3 }
numbers.each { |k, v| p "#{k}, #{k.class} -> #{v}" }
p numbers
numbers = { :one => 1, :two => 2, :three => 3 }
numbers.each { |k, v| p "#{k}, #{k.class} -> #{v}" }
p numbers
numbers = { one: 1, two: 2, three: 3 }
p numbers
numbers.each { |k, v| p "#{k}, #{k.class} -> #{v}" }
