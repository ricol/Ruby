#!/usr/bin/env ruby

total = 1
num = 150
(1..num).each do |value| total *= value end
puts "Normal: #{num}! = #{total.to_f}"

total_thread_no_sync = 1
threads = []
(1..num).each do |value|
  aThread = Thread.new do
    total_thread_no_sync *= value
  end
  threads << aThread
end

threads.each do |thread| thread.join end

puts "Using threads with no sync: #{num}! = #{total_thread_no_sync.to_f}"
puts "Checking result: #{total == total_thread_no_sync}"

total_thread_with_sync = 1
threads = []
mutex = Mutex.new
(1..num).each do |value|
  aThread = Thread.new do
    mutex.synchronize do
      total_thread_with_sync *= value
    end
  end
  threads << aThread
end

puts "Using threads with sync: #{num}! = #{total_thread_with_sync.to_f}"
puts "Checking result: #{total == total_thread_with_sync}"
