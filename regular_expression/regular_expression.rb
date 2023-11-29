#!/usr/bin/env ruby

def are_you_sure
  while true
    print "Are you sure? [y/n]:"
    response = gets
    case response
    when /^[yY]/
      return true
    when /^[nN]/, /^$/
      return false
    end
  end
end

=begin
while !are_you_sure
end
=end

puts "you passed."

st = "\033[7m"
en = "\033[m"

puts "Enter an empty string at any time to exit."

=begin
while true
	print "str> "; STDOUT.flush; str = gets.chop
	break if str.empty?
	print "pat> "; STDOUT.flush; pat = gets.chop
	break if pat.empty?
	re = Regexp.new(pat)
	puts str.gsub(re, "#{st}\\&#{en}")
end
=end

puts "regular expression demo..."
m1 = /uby/.match("asdfasdfubysasdf")
puts m1
m2 = "The future is Ruby" =~ /Ruby/
puts m2
