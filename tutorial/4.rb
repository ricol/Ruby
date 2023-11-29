#!/usr/bin/env ruby

def hello
  "Hello"
end

#use the method
puts hello

# Method with an argument - 1
def hello1(name)
  "Hello " + name
end

puts(hello1("satish"))

# Method with an argument - 2
def hello2(name2)
  "Hello " + name2
end

puts(hello2 "talim")

def mtd(arg1 = "Dibya", arg2 = "Shashank", arg3 = "Shashank")
  "#{arg1}, #{arg2}, #{arg3}."
end

puts mtd
puts mtd("ruby")
puts mtd("ruby", "ricol")

def oldmtd
  "old method"
end

alias newmtd oldmtd

def oldmtd
  "old improved method"
end

puts oldmtd
puts newmtd

def foo(*my_string)
  my_string.inspect
end

puts foo("hello", "world")
puts foo()

def downer(string)
  string.downcase
end

a = "HELLO"
downer(a) # -> "hello"
puts a # -> "HELLO"

def downer(string)
  string.downcase!
end

a = "HELLO"
downer(a) # -> "hello"
puts a # -> "hello"
