#!/usr/bin/env ruby

if ARGV.length <= 0
  puts "Usage: app <number>"
  exit
end

class Array
  def updateValueByBlock!
    each_with_index do |n, i|
      self[i] = yield(n)
    end
  end

  def updateValueByProc!(code)
    each_with_index do |n, i|
      self[i] = code.call(n)
    end
  end

  def printValueByProc!(code)
    code[:starting].call
    puts "Self.data: #{self}"
    code[:ending].call
    code[:other].call
  end
end

o = [1, 2, 3, 4]

a = o.dup

puts "before...a: #{a}"

a.updateValueByBlock! do |n|
  n ** ARGV[0].to_i
end

puts "after...a: #{a}"

b = o.dup

puts "before...b: #{b}"

b.updateValueByProc!(proc do |n|
  n ** ARGV[0].to_i
end)

puts "after...b: #{b}"

c = o.dup

puts "before...c: #{c}"

c.printValueByProc!(starting: proc { puts "Staring..." }, ending: proc { puts "Ending." }, other: proc { puts "Other..." })

puts "after...c: #{c}"

d = o.dup

puts "before...d: #{d}"

d.updateValueByProc!(->(n) { n ** ARGV[0].to_i })

puts "after...d: #{d}"
