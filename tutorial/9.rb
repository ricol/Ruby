#!/usr/bin/env ruby

# Arrays

# Empty array
var1 = []
# Array index starts from 0
puts var1[0]

# an array holding a single number
var2 = [5]
puts var2[0]

# an array holding two strings
var3 = ["Hello", "Goodbye"]
puts var3[0]
puts var3[1]

flavour = "mango"
# an array whose elements are pointing
# to three objects - a float, a string and an array
var4 = [80.5, flavour, [true, false]]
puts var4[2]

# a trailing comma is ignored
name = ["Satish", "Talim", "Ruby", "Java"]
puts name[0]
puts name[1]
puts name[2]
puts name[3]
# the next one outputs nil
# nil is Ruby's way of saying nothing
puts name[4]
# we can add more elements too
name[4] = "Pune"
puts name[4]
# we can add anything!
name[5] = 4.33
puts name[5]
# we can add an array to an array
name[6] = [1, 2, 3]
puts name[6]

# some methods on arrays
newarr = [45, 23, 1, 90]
puts newarr.sort
puts newarr.length
puts newarr.first
puts newarr.last

# method each (iterator) - extracts each element into loc
# do end is a block of code
# we shall talk about blocks soon here -
# /satishtalim/ruby_blocks_and_procs.html
# variable loc refers to each item in the array as it goes through the loop
locations = ["Pune", "Mumbai", "Bangalore"]

locations.each do |loc|
  puts "I love " + loc + "!"
  puts "Don't you?"
end

# delete an entry in the middle and shift the remaining entries
locations.delete("Mumbai")
locations.each do |loc|
  puts "I love " + loc + "!"
  puts "Don't you?"
end

def mtdarry
  10.times do |num|
    square = num * num
    return num, square if num > 5
  end
end

# using parallel assignment to collect the return value
num, square = mtdarry
puts num
puts square

ENV.each { |k, v| puts "#{k}: #{v}" }

require "getoptlong"

# Call using "ruby tsftpc.rb -hftp.ibiblio.org -n21 -uanonymous -ps@s.com"
# The parameters can be in any order
unless ARGV.length == 4
  puts "Usage: ruby tsftpc.rb -hftp_site_url -nport_no -uuser_name -ppassword"
  exit
end

host_name = port_no = user_name = password = ""
# specify the options we accept and initialize
# the option parser
opts = GetoptLong.new(
  ["--hostname", "-h", GetoptLong::REQUIRED_ARGUMENT],
  ["--port", "-n", GetoptLong::REQUIRED_ARGUMENT],
  ["--username", "-u", GetoptLong::REQUIRED_ARGUMENT],
  ["--pass", "-p", GetoptLong::REQUIRED_ARGUMENT]
)
# process the parsed options
opts.each do |opt, arg|
  case opt
  when "--hostname"
    host_name = arg
  when "--port"
    port_no = arg
  when "--username"
    user_name = arg
  when "--pass"
    password = arg
  end
end
