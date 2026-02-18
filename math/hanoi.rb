#!/usr/bin/env ruby

A = []
B = []
C = []

def hanoi(n, a, c, b)
	if n == 1
		move(n, a, c)
	else
		hanoi(n - 1, a, b, c)
		move(n, a, c)
		hanoi(n - 1, b, c, a)
	end
end

def move(disk, from, to)
	mapping = {"a" => A, "b" => B, "c" => C}
	puts("move #{disk} from #{from} to #{to}")
	value = mapping[from].pop
	mapping[to].push(value)
	show()
end

def show()
	puts "A: #{A}"
	puts "B: #{B}"
	puts "C: #{C}"
end

A.push(5, 4, 3, 2, 1)
show()
hanoi(5, "a", "c", "b")
