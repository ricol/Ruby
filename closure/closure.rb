#!/usr/bin/env ruby

def multiplier(n)
  lambda { |data| data.collect { |x| x * n } }
end

doubler = multiplier(2)
puts doubler.call([1, 2, 3])

def accessor_pair(initialValue = nil)
  value = initialValue
  getter = lambda { value }
  setter = lambda { |x| value = x }
  return getter, setter
end

getX, setX = accessor_pair(0)
puts getX[]
setX[10]
puts getX[]
