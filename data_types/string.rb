#!/usr/bin/env ruby

person1 = "ricol wang"
person2 = person1
person3 = person1.dup

puts person1
puts person2
puts person3

person1[0] = "R"

puts person1
puts person2
puts person3

person1[person1.length - 1] = "G"
puts person1
puts person2
puts person3

person1 = "qian chun yan"

puts person1
puts person2
puts person3
10.times { puts "test".object_id }
s = "hello"
s["l"] = "L" while s["l"]
puts s

s = "ruby"
t = s
puts s
puts t
t[-1] = ""
puts s
t = "Java"
puts s
puts t

MyDocument = <<HERE.freeze
	This is a string literal
	It has two lines and abruptlsdfasdfiasdf
HERE

puts "MyDocument: #{MyDocument}"

MyTest = <<-DOC
This is test
						DOC
puts "MyTest: #{MyTest}"

10.times do
  printf("id: %x\n", "test".object_id)
end

s = "hello"
s.concat(" world")
s.insert(5, " there")
s.slice(0, 5)
s.slice!(5, 6)
s.eql?("hello world")
s.length
s.size
s.bytesize
s.empty?
"".empty?

s.index("h")

puts "this is it".split
puts "hello".split("l")

puts "world".upcase
puts "world".upcase!
puts "WORLD".downcase
puts "WORLD".capitalize

s = "hello\r\n"
puts s.chomp!
puts s.chomp("o")

s = "\t hello \n"
puts s.strip
puts s.lstrip
puts s.rstrip

s.each_byte do |b|
  print b, " "
end

s.each_line do |l|
  print l
end

puts s.bytes.to_a
puts s.lines.to_a
puts s.chars.to_a

puts "10".to_i
puts "10".to_i(10)

s = "wangxinghe"
puts s.sum
puts s.sum(8)
puts s.crypt("ab")

s = "wangxinghe"
s << " ricolwang" << " qianchunyan"

s.each_char do |x|
  print "#{x} "
end

puts "s: #{s}"

s = "$" * 100
puts "s: #{s}"

s = "hello"
s.concat(" world")
s.insert(5, " there")
s.slice(0, 5)
s.slice!(5, 6)
s.eql?("hello world!")
s.length
s.size
s.bytesize
s.empty?
"".empty?
s = "hello"
s.index("l")
s.index("l")
s.index(/l+/)
s.index("l", 3)
s.index("Ruby")
s.rindex("l")
s.rindex("l", 2)
s.start_with? "hell"
s.end_with? "bells"
s.include?("ll")
s.include?("H")

s =~ /[aeiou]{2}/
s.match(/[aeiou]/, &:to_s)

a = "this is it".split
puts "a: #{a}"

a = "hello".split("l")
puts "a: #{a}"

s = "world"
s.upcase
s.upcase!
s.downcase
s.downcase!
s.capitalize
s.capitalize!
s.swapcase

s = "hello\r\n"
s.chomp!
s.chomp
s.chomp("o")

s = "hello\n"
s.chop!
s.chop
"".chop
"".chop!

s = "\t hello \n"
s.strip
s.lstrip
s.rstrip

s = "x"
s.ljust(3)
s.rjust(3)
s.center(3)
s.center(5, "-")
s.center(7, "-=")

s = "A\nB"
s.each_byte { |b| print b, " " }
s.each_line { |l| print l.chomp }

s.each_char { |c| print c, " " }

a = s.bytes.to_a
b = s.lines.to_a
c = s.chars.to_a

puts "a: #{a}"
puts "b: #{b}"
puts "c: #{c}"

"10".to_i
"10".to_i(2)
"10".hex
"0xff".hex

a = []
(1..10).each do |x|
  a << x
end

puts "a: #{a}"
b = a.pack("i10")
c = b.unpack("i*")
c == a

m = "hello world"
data = [m.size, m]

puts "data: #{data}"
template = "Sa*"
b = data.pack(template)
puts "packed data: #{b}"
c = b.unpack(template)
puts "unpacked data: #{c}"

puts format("pi is about: %.4f", Math::PI)
puts format("pi is about %.4f", Math::PI)
puts format("%s: %f", "PI", Math::PI)

puts "Don't worry about escaping ' characters!"
puts '"How are you?", he said'

puts "Don't worry about escaping ' characters!"
puts %("how are you?", he said)
puts %(This string literal ends with a newline\n)

a = "A"
a << 30
a << 31
a << 60
a << 256
a << "B"
puts a
puts a * 3

a = "wangxinghe"
puts a.length
puts a.bytesize
