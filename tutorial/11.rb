#!/usr/bin/env ruby

puts "string".object_id
puts "string".object_id
puts :symbol.object_id
puts :symbol.object_id

all = Symbol.all_symbols
puts all.join(",")

name = "ricol.wang"
names = name.split(".")
puts name
puts names

class Test
  puts :Test.object_id.to_s

  def test
    puts :test.object_id.to_s
    @test = 10
    puts :test.object_id.to_s
  end
end

t = Test.new
t.test

know_ruby = :yes
if know_ruby == :yes
  puts "You are a Rubyist"
else
  puts "Start learning Ruby"
end

know_ruby = "yes"
if know_ruby == "yes"
  puts "You are a Rubyist"
else
  puts "Start learning Ruby"
end

puts "string".to_sym.class # Symbol
puts :symbol.to_s.class    # String
