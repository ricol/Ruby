#!/usr/bin/env ruby

iterator = 9.downto(1)
begin
  print iterator.next while true
  puts "never execute..."
rescue => exception
  puts "\nexception: #{exception}, class: #{exception.class}"
end

enumerator = 3.times
enumerator.each { |x| puts x }

iterator = 10.downto(1)
loop do
  print iterator.next
end
puts "\nend."

def sequence(*enumerables, &block)
  enumerables.each do |e|
    e.each(&block)
  end
end

def interleave(*enumerables)
  enumerators = enumerables.map { |e| e.to_enum }
  until enumerators.empty?
    begin
      e = enumerators.shift
      yield e.next
    rescue => exception
    else
      enumerators << e
    end
  end
end

def bundle(*enumerables)
  enumerators = enumerables.each { |e| e.to_enum }
  loop { yield enumerators.map { |e| e.next } }
end

a, b, c = [1, 2, 3], 4..6, "a".."e"
sequence(a, b, c) { |x| print x }
puts
interleave(a, b, c) { |x| print x }
puts
bundle(a, b, c) { |x| print x }
