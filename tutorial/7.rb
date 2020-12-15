#!/usr/bin/env ruby

var = 5
if var > 4
  puts "Variable is greater than 4"
  puts "I can have multiple statements here"
  if var == 5
    puts "Nested if else possible"
  else
    puts "Too cool"
  end
else
  puts "Variable is not greater than 5"
  puts "I can have multiple statements here"
end

puts "Hello, what's your name?"
STDOUT.flush
name = gets.chomp
puts "Hello, " + name + "."

if name == "Satish"
  puts "What a nice name!!"
else
  if name == "Sunil"
    puts "Another nice name!"
  end
end

# Modified example with elseif
puts "Hello, what's your name?"
STDOUT.flush
name = gets.chomp
puts "Hello, " + name + "."

if name == "Satish"
  puts "What a nice name!!"
elsif name == "Sunil"
  puts "Another nice name!"
end

# Further modified
puts "Hello, what's your name?"
STDOUT.flush
name = gets.chomp
puts "Hello, " + name + "."

# || is the logical or operator
if name == "Satish" || name == "Sunil"
  puts "What a nice name!!"
end

unless ARGV.length == 2
  puts "Usage: program.rb 23 45"
  exit
end

var = 0
while var < 10
  puts var
  var += 1
end

age = 15
# We talk about the Range class later on
# will output teenager
puts (13...19).include?(age) ? "teenager" : "not a teenager"

year = 2000
leap = case
  when year % 400 == 0
    true
  when year % 100 == 0
    false
  else
    year % 4 == 0
  end
puts leap
# output is: true

# We can determine our object's class and its unique object ID
# NIL is synonym for nil
puts NIL.class # NilClass
puts nil.class # NilClass
puts nil.object_id # 4
puts NIL.object_id # 4

# FALSE is synonym for false
puts FALSE.class # FalseClass
puts false.class # FalseClass
puts false.object_id # 0
puts FALSE.object_id # 0
