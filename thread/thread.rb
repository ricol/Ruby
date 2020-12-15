#!/usr/bin/env ruby

count = 0
arr = []

10.times do |i|
  arr[i] = Thread.new do
    sleep(rand(0) / 10.0)
    Thread.current["mycount"] = count
    count += 1
  end
end

arr.each do |t|
  t.join
  print t["mycount"], ", "
end

puts "count = #{count}"

puts "Demo mutex..."
count1 = count2 = 0
difference = 0
mutex = Mutex.new
count = 0
counter = Thread.new do
  1000.times do
    mutex.synchronize do
      count1 += 1
      count2 += 1
    end
  end
end

spy = Thread.new do
  1000.times do
    mutex.synchronize do
      difference += (count1 - count2).abs
      if difference > 0 then puts "difference: #{difference}" end
    end
  end
  puts "no difference." if difference <= 0
end

counter.join
spy.join
puts "end demo mutex"

puts "Demo conditionvariable..."
cv = ConditionVariable.new

a = Thread.new do
  mutex.synchronize do
    puts "A: I have critical section, but will wait for cv..."
    cv.wait(mutex)
    puts "A: I have critical section again! I rule!"
  end
end

puts "(Later, back at the ranch...)"

b = Thread.new do
  mutex.synchronize do
    puts "B: Now I am critical, but am done with cv."
    cv.signal
    puts "B: I am still critical, finishing up."
  end
end
