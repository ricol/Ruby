#!/usr/bin/env ruby

require "timeout"

for snooze in 1..2
  puts "About to sleep for #{snooze}"
  timeout(1.5) do
    sleep(snooze)
  end
  puts "That was refreshing"
end
