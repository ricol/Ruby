#!/usr/local/bin/ruby

# PI = 4 * (1 / 1 - 1 / 3 + 1 / 5 - 1 / 7 + ...)

def pi(n)
  i = 0
  num = 1.0
  sum = 0
  while i < n
    sum += (-1) ** i * (1.0 / num)
    i += 1
    num += 2
  end
  sum * 4
end

puts "calculating..."
STDOUT.flush
NUM = 1_000_000
(NUM..NUM + 10).each do |n|
  puts "n: #{n} -> pi: #{pi(n)}"
  STDOUT.flush
end
puts "done."
