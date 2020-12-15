#!/usr/bin/env ruby

# thread pool class
class ThreadPool
  def initialize(size)
    @size = size
    @jobs = Queue.new
    @pool = Array.new(@size) do |i|
      Thread.new do
        Thread.current[:id] = i
        catch(:exit) do
          loop do
            job, args = @jobs.pop
            puts "#{Thread.current[:id]} is running new task ... job: #{job}, args: #{args}"
            STDOUT.flush
            job.call(*args)
            puts "#{Thread.current[:id]} finished current task"
            STDOUT.flush
          end
        end
      end
    end
  end

  # add a job to queue
  def schedule(*args, &block)
    @jobs << [block, args]
  end

  # run threads and perform jobs from queue
  def run!
    @size.times do
      schedule { throw :exit }
    end
    @pool.map(&:join)
  end
end

# an instance of ThreadPool with 5 threads
pool = ThreadPool.new(5)

# add 20 tasks to query
20.times do |i|
  pool.schedule do
    sleep_time = rand(4) + 2
    sleep(sleep_time)
    STDOUT.flush
  end
end

# run all threads
pool.run!

puts "end"
