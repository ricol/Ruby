#!/usr/bin/env ruby

require "profile"

class Peter
  def initialize(amt)
    @value = amt
  end

  def rob(amt)
    @value -= amt
    amt
  end
end

class Paul
  def initialize
    @value = 0
  end

  def pay(amt)
    @value += amt
  end
end

peter = Peter.new(1000)
paul = Paul.new
1000.times do
  paul.pay(peter.rob(10))
end
