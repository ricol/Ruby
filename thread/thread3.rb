#!/usr/local/bin/ruby

puts "Thread.current: #{Thread.current}"
puts "Thread.list: #{Thread.list}"

threads = []
100.times do 
	t = Thread.new { 
		sleep(rand(10))
		puts "#{Thread.current}... #{rand(100)}"
		STDOUT.flush
	}
	threads << t
end

threads.each { |t| t.join }
