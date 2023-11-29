#!/usr/bin/env ruby

def join_all
  10.times do
    Thread.new do
      num = rand(10)
      Thread.current[:num] = num if rand(10) > 5
      puts "new thread<#{num}> begin..."
      puts "Thread info: #{Thread.current}"
      puts "sleep for #{num} seconds..."
      STDOUT.flush
      sleep(num)
      puts "thread end<#{num}>."
      STDOUT.flush
    end
  end

  #=begin
  main = Thread.main
  current = Thread.current
  all = Thread.list
  all.each do |t|
    puts "Waiting for thread #{t}...Status: #{t.status}"
    puts "Thread[:num]= #{t[:num]}" if t.key?(:num)
    STDOUT.flush
    t.join unless t == current or t == main
    puts "Status: #{t.status}"
    STDOUT.flush
  end
  #=end
end

join_all
