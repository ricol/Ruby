#!/usr/bin/env ruby

x = 1
y = 2
z = 3
a = "wangxinghe"
b = "ricolwang"
c = "qianchunyan"
A = true
B = false
C = [1, 2, 3].freeze
puts x, y, z
puts a, b, c
puts A, B, C
puts x
puts y
puts z
puts a
puts b
puts c
puts A
puts B
puts C

puts "demo assignemtn ambigurous"

def x
  1
end

puts x
x = 0 if true
puts x
x = 2
puts x

a = 100
b = 200
puts a + b

version = "1.2.3.4.5.6.7.8"
components = version.split(".")
puts "components.class: #{components.class}"
first, second, third, *last = version.split(".")
puts "first: #{first}, second: #{second}, third: #{third}, last: #{last}"
document = <<start
tasdfasdf
asdfasdfas;a;sdfj12l3jljpo879087aj;sdf

HERE
a
start
puts document
