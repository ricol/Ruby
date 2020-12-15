#!/usr/bin/env ruby

class Dog
  def initialize(breed, name)
    # Instance variables
    @breed = breed
    @name = name
  end

  def bark
    puts "Ruff! Ruff!"
  end

  def display
    puts "I am of #{@breed} breed and my name is #{@name}"
  end
end

# make an object
# Objects are created on the heap
d = Dog.new("Labrador", "Benzy")

=begin  
  Every object is "born" with certain innate abilities.  
  To see a list of innate methods, you can call the methods  
  method (and throw in a sort operation, to make it  
  easier to browse visually). Remove the comment and execute.  
=end
# puts d.methods.sort

# Amongst these many methods, the methods object_id and respond_to? are important.
# Every object in Ruby has a unique id number associated with it
puts "The id of d is #{d.object_id}."

# To know whether the object knows how to handle the message you want
# to send it, by using the respond_to? method.
if d.respond_to?("talk")
  d.talk
else
  puts "Sorry, d doesn't understand the 'talk' message."
end

d.bark
d.display

# making d and d1 point to the same object
d1 = d
d1.display

# making d a nil reference, meaning it does not refer to anything
d = nil
d.display

# If I now say
d1 = nil
# then the Dog object is abandoned and eligible for Garbage Collection (GC)

class Dummy
  def method_missing(m, *args, &block)
    block.call if block
    puts "There's no method called #{m} here -- please try again."
  end
end

class DummyNew
  def method_missing(m, *args)
    yield if block_given?
    puts "There's no method called #{m} here -- please try again."
  end
end

aDummy = Dummy.new
aDummy.say
aDummy.anything { puts "a block called" }

aDummy = DummyNew.new
aDummy.say
aDummy.anything { puts "a block called" }

prc = lambda { puts "Hello" }
# method call invokes the block
prc.call

# another example
toast = lambda do
  "Cheers"
end
puts toast.call

=begin  
  You cannot pass methods into other methods (but you can pass procs into methods),  
  and methods cannot return other methods (but they can return procs)  
=end

def some_mtd(some_proc)
  puts "Start of mtd"
  some_proc.call
  puts "End of mtd"
end

say = lambda do
  puts "Hello"
end

some_mtd say

a_Block = lambda { |x| "Hello #{x}!" }
puts a_Block.call "World"
# output is: Hello World!

ablock = lambda { |x| puts x }
ablock.call "wang"

(lambda { |x| puts x }).call "ricol"
