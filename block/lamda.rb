#!/usr/bin/env ruby

puts ->(x) { x * x } == ->(x) { x * x }
p = ->(x) { x * x }
q = p.dup
puts p == q
puts p.object_id == q.object_id

def test
  puts "entering method"
  1.times do
    puts "entering block"
    return
  end
  puts "exiting method"
end

test

def test
  puts "entering method"
  p = proc do
    puts "entering proc"
    return
  end
  p.call
  puts "exiting method"
end

test

def procBuild(message)
  proc do
    puts message
  end
end

def test
  puts "entering method"
  p = procBuild("entering proc")
  p.call
  puts "exiting method"
end

test

def test
  puts "entering method"
  p = lambda {
    puts "entering lambda"
    return
  }
  p.call
  puts "exiting method"
end

test

def lambdaBuilder(message)
  lambda {
    puts message
    return
  }
end

def test
  puts "entering method"
  l = lambdaBuilder("entering lambda")
  l.call
  puts "exiting method"
end

test

def multiplier(n)
  lambda { |data|
    data.collect do |x|
      x * n
    end
  }
end

doubler = multiplier(2)
puts doubler.call([1, 2, 3])
