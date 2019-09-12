#!/usr/local/bin/ruby

def print_two(*args)
  arg1, arg2 = args
  puts "print_two -> arg1: #{arg1}, arg2: #{arg2}"
end

def print_two_again(arg1, arg2)
  puts "print_two_again -> arg1: #{arg1}, arg2: #{arg2}"
end

def print_one(arg1)
  puts "print_one -> arg1: #{arg1}"
end

def print_none
  puts "print_none -> "
end

print_two("one", "two")
print_two_again("one", "two")
print_one("one")
print_none
