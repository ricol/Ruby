#!/usr/bin/env ruby

class Person
  def initialize
    @name = ""
    @age = 0
    @address = ""
    @gender = 0
  end

  def show
    puts "name: #{@name}"
    puts "age: #{@age}"
    puts "address: #{@address}"
    puts "gender: #{(@gender == 0 ? "female" : "male")}"
  end

  attr_writer :name, :age, :address, :gender
end

class MyClass
  def initialize
    @p = Person.new
    yield @p if block_given?
  end

  def print
    @p.show
  end
end

puts "Create a person with no block initialization..."
me = MyClass.new
me.print

puts "Create a person with a block initialization..."
me = MyClass.new do |p|
  p.name = "wangxinghe"
  p.age = 32
  p.address = "51 Cardigan Street, Carlton, 3053, VIC, Australia"
  p.gender = 1
end
me.print

def p
  yield rand(100) if block_given?
end

p { |x| puts x }
p { }
p { |x| }
p { |x| puts x * x }
p
