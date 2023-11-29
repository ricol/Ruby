#!/usr/bin/env ruby

t = Trie.new

#       key     value
t.push("Hello", "World")
t.push("Hilly", "Billy")
t.push("Hello Bob", "Heya")

# regular lookup
t["Hilly"] # => "Billy"

# find longest matching prefix
t.longest_prefix("Hello stranger") # => "Hello"

# find all keys that start with H*llo (* is a wildcard)
t.wildcard("H*ll*") # => ["Hello", "Hilly"]

puts t
