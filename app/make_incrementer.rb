#!/usr/bin/env ruby

def make_incrementer(delta)
  ->(x) { x + delta }
end

incrementer_proc_of = {}
[10, 20].each do |delta|
  incrementer_proc_of[delta] = make_incrementer(delta)
end
incrementer_proc_of.each_pair do |delta, incrementer_proc|
  puts "#{delta} + 5 = #{incrementer_proc.call(5)}"
end
puts
incrementer_proc_of.each_pair do |delta, incrementer_proc|
  (0..5).to_a.each do |other_added|
    puts "#{delta} + #{other_added} = " + incrementer_proc.call(other_added).to_s + "\n"
  end
end
