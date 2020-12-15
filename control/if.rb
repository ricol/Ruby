#!/usr/bin/env ruby

first, second = ARGV

puts "Demo if..."

if !first || !second
  puts "please specify first and second argument!\n"
else
  if first < second
    puts "#{first} < #{second}"
  elsif first == second
    puts "#{first} = #{second}"
  elsif first > second
    puts "#{first} > #{second}"
  else
    puts "this shoud not happen!"
  end
end

puts "if..." if true

puts "Demo unless..."

if false
  puts "this should not happen."
else
  puts "this is unless statement"
end

puts "unless..." unless false

puts "Demo case..."
x = 1
x = 5
x = "a"
case x
when 1, 2, 3, 4, 5
  puts "1, 2, 3, 4, 5"
when "a", "b", "c", "d"
  puts "a", "b", "c", "d"
else
  puts "nothing"
end

puts "Demo ? : ..."
1 > 2 ? puts("1 > 2 is true") : puts("1 > 2 is false")
1 > 2 ? (puts "1 > 2 is true") : (puts "1 > 2 is false")
