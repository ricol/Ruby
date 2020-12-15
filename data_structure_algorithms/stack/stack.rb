#!/usr/bin/env ruby

def printStack(s)
  puts s.to_s
end

stack = []
printStack(stack)
stack.push(1)
printStack(stack)
stack.push(2, 3)
printStack(stack)
stack.pop
printStack(stack)

t = "a{b{c}d}".split(//)
puts "t: #{t}"

stack = []
t.each do |x|
  stack.push(x) if x == "{"
end

puts "stack: #{stack}"

t.each do |x|
  stack.pop if x == "}"
end

puts "stack: #{stack}"

def check_braces(t)
  s = []
  balancedSoFar = true
  i = 0
  while (i < t.count) && balancedSoFar
    if t[i] == "{"
      s.push(t[i])
    elsif t[i] == "}"
      if s.count > 0
        s.pop
      else
        balancedSoFar = false
      end
    end
    i += 1
  end

  (balancedSoFar && (s.count == 0))
end

t = "{abcs{asdfd}asd}".split(//)
puts "check_braces(#{t}) = #{check_braces(t)}"
t = "{asdf{asdf{asdf}asd}".split(//)
puts "check_braces(#{t}) = #{check_braces(t)}"

def fibonacci_stack(n)
  s = []
  s.push(n)
  result = 0
  while s.count > 0
    current = s.pop
    if current == 0
      result += 0
    elsif current == 1
      result += 1
    else
      s.push(current - 2)
      s.push(current - 1)
    end
  end
  result
end

(1..30).each do |n|
  puts "fibonacci_stack(#{n}) = #{fibonacci_stack(n)}"
end
