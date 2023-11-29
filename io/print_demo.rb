#!/usr/bin/env ruby

a = [1, 2, 3, 4]
b = ["a", "b", "c", "d"]
c = ["ABC", "abc", "123"]
d = %w[ABC abc 123]
i = 1
f = 1.234
g = true
printf("a = %s\n", a)
printf("b = %s\n", b)
printf("c = %s\n", c)
printf("d = %s\n", d)
printf("i = %3d\n", i)
printf("f = %2.2f\n", f)
puts "g = #{g}"
x = 1
printf("x = %2d\n", x)
x = 1.2345
printf("x = %.50f\n", x)
x = "x"
printf("x = %c\n", x)
x = "wangxinghe"
printf("x = %20s\n", x)
i = 123
printf("i = %d; i = %s; i = %c\n", i, i, 0x35)
num = 0xff
printf("num: %d, hex: %x, bin: %b\n", num, num, num)
