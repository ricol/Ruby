#!/usr/bin/env ruby

puts "Demo 1..."
a = 102.7
b = 95.1
ObjectSpace.each_object(Numeric) do |x|
  puts x
end

puts "Demo 2..."
a = 102
b = 95
ObjectSpace.each_object(Numeric) do |x|
  puts x
end

puts "Demo 3..."
r = 1..10
list = r.methods
puts list.length
puts list[0..3]

puts "Demo 4..."
puts r.respond_to?("frozon?")
puts r.respond_to?("hasKey")
puts "me".respond_to?("==")

puts "Demo 5..."
tmpClass = Integer
begin
  print tmpClass
  tmpClass = tmpClass.superclass
  print " < " if tmpClass
end while tmpClass
puts
p Integer.ancestors

puts "Demo 6..."

class Demo
  private

  def privMethod; end

  protected

  def protMethod; end

  public

  def pubMethod; end

  def self.classMethod; end

  CONST = 1.23
end

puts Demo.private_instance_methods
puts Demo.protected_instance_methods
puts Demo.public_instance_methods
puts Demo.singleton_methods
puts Demo.constants - Demo.superclass.constants

puts "Demo 7..."
require "benchmark"
include Benchmark

test = "Stormy Weather"
m = test.method(:length)
n = 100_000

bm(12) do |x|
  x.report("call") { n.times { m.call } }
  x.report("send") { n.times { test.send(:length) } }
  x.report("eval") { n.times { eval "test.length" } }
end
