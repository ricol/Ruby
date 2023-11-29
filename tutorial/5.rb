#!/usr/bin/env ruby

s1 = "Jonathan"
s2 = "Jonathan"
s3 = s1
puts s1 == s2 ? "Both Strings have identical content" : "Both Strings do not have identical content"
if s1.eql?(s2)
  puts "Both Strings have identical content"
else
  puts "Both Strings do not have identical content"
end
if s1.equal?(s2)
  puts "Two Strings are identical objects"
else
  puts "Two Strings are not identical objects"
end
if s1.equal?(s3)
  puts "Two Strings are identical objects"
else
  puts "Two Strings are not identical objects"
end

names1 = ["ann", "richard", "william", "susan", "pat"]
puts names1[0] # ann
puts names1[3] # susan
# this is the same:
names2 = %w{ ann richard william susan pat }
puts names2[0] # ann
puts names2[3] # susan

names3 = %w[wang xing he]
[names1, names2, names3].each do |array|
  array.each do |w|
    print w + "\t"
  end
  print "\n"
end

puts Encoding.list
