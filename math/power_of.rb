#!/usr/bin/env ruby

class Integer
  def power_of(base)
    return nil unless base.is_a?(Integer)
    return nil if (base.zero? and not [0, 1].include?(self))

    return 1 if base == self
    return 0 if self == 1
    return false if base == 1
    return false if base.abs > self.abs

    exponent = (self / base).power_of(base)
    return exponent ? exponent + 1 : exponent
  end
end

for x in (1..10)
  for y in (1..x)
    z = x.power_of(y)
    puts "#{x}.power_of(#{y}): #{z}"
  end
end
