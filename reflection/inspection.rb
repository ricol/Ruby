#!/usr/bin/env ruby

require "benchmark"   # from the Ruby Application Archive
include Benchmark

print "Demo1..."
test = "Stormy Weather"
m = test.method(:length)
n = 100000

bm(12) { |x|
  x.report("call") { n.times { m.call } }
  x.report("send") { n.times { test.send(:length) } }
  x.report("eval") { n.times { eval "test.length" } }
}

print "\nDemo2..."
a = 102.7
b = 95.1
ObjectSpace.each_object(Numeric) { |x| p x }

a = 102
b = 95
ObjectSpace.each_object(Numeric) { |x| p x }

print "\nDemo3..."

class Test
  def test
    a = 1
    b = 2
  end
end

set_trace_func proc { |event, file, line, id, binding, classname|
  printf "%8s %s:%-2d %10s %8s\n", event, file, line, id, classname
}
t = Test.new
t.test

print "\nDemo4..."

def catA
  puts caller.join("\n")
end

def catB
  catA
end

def catC
  catB
end

catC
