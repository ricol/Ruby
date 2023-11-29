#!/usr/bin/env ruby

def calculate(threadId, n)
  puts "Thread #{threadId} begin..."
  $stdout.flush
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i ** 2..n).step(i) { |m| nums[m] = nil } if nums[i]
  end
  nums.compact
  puts "Thread #{threadId} end. result: #{nums.count}"
  $stdout.flush
end

MAX_PRIME = 10_000_000
THREADS = 10
threads = []
1.upto(THREADS) do |num|
  threads[num] = Thread.new { calculate num, MAX_PRIME }
end
1.upto(THREADS) do |num|
  threads[num].join
end
