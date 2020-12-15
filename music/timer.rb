#!/usr/bin/env ruby

class Timer
  def initialize(resolution)
    @resolution = resolution
    @queue = []

    Thread.new do
      while true
        dispatch
        sleep(@resolution)
      end
    end
  end

  def dispatch
    now = Time.now.to_f
    ready, @queue = @queue.partition { |time, proc| time <= now }
    ready.each { |time, proc| proc.call(time) }
  end

  def at(time, &block)
    time = time.to_f if time.kind_of?(Time)
    @queue.push [time, block]
  end
end

timer = Timer.new(0.1)
timer.at(Time.now + 1) { puts "hello" }
