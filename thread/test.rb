#!/usr/bin/env ruby

class Pool
  def initialize(size)
    @size = size
    @run = false
    @tasks = []
  end

  def add(&block)
    @tasks << block
  end

  def run
    return if @run
    @run = true

    @array = Array.new(@size)
    @size.times do |i|
      t = Thread.new {
        while true
          if @tasks.size <= 0
            next
          end
          task = @tasks.first
          @tasks.delete(task)
          Thread.current[:tasks] = Thread.current[:tasks] || []
          Thread.current[:tasks] << task
          puts "thread #{Thread.current[:id]} is running task...#{task} remaining tasks: #{@tasks.count}"
          STDOUT.flush
          task.call
          puts "thread #{Thread.current[:id]} complete task. #{task} remaining tasks: #{@tasks.count}"
          STDOUT.flush
        end
        puts "thread #{Thread.current[:id]} has completed #{Thread.current[:tasks].count} tasks remaining tasks: #{@tasks.count}"
      }
      t[:id] = i
      @array << t
    end
  end

  def join
    puts "start join..."
    @array.each do |t|
      if t
        puts "thread #{t[:id]} join..."
        t.join
      end
    end
    puts "after joing."
  end
end

def test
  puts "starting task..."
  STDOUT.flush
  time = (rand * 10).to_i
  puts "sleep #{time} seconds..."
  STDOUT.flush
  sleep(time)
  puts "end task"
  STDOUT.flush
end

t = Time.now
p = Pool.new(10)
p.run

#seeding
Thread.new {
  while true
    time = (rand * 10).to_i
    sleep(time)
    puts "Seeding tasks..."
    (rand * 30).to_i.times do
      p.add {
        test
      }
    end
  end
}.join

p.join

puts "time cost: #{Time.now - t} seconds"
