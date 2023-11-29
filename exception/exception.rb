#!/usr/bin/env ruby

def factorial(n)
  raise "Invalid #{n}" if n < 1
  return 1 if n == 1
  n * factorial(n - 1)
end

begin
  n = 0
  puts "factorial(#{n})=" + factorial(n).to_s
rescue RuntimeError => er
  puts er.message
rescue Exception => er
  puts er.message
end

def explode
  raise "bam!" if rand(10) == 0
end

def risky
  begin
    10.times do
      explode
    end
  rescue TypeError
    puts $ERROR_INFO
  end
  "hello"
end

def defuse
  puts risky
rescue RuntimeError => e
  puts e.message
end

puts "demo defuse..."
defuse

puts "demo url..."
require "open-uri"

tries = 0
begin
  puts "try #{tries}..."
  tries += 1
  open("http://www.163.com/")
rescue OpenURI::HTTPError => e
  puts e.message
  if tries < 4
    n = 2 ** tries
    sleep(n)
    puts "sleep for #{n} seconds..."
    retry
  end
rescue Exception => e
  puts e.message
end

puts "end demo."

def test(n)
  puts "begin test...#{n}"

  begin
    raise "an exception" if n > 5
    puts "no exception."
  rescue Exception => e
    puts "exception: #{e}"
  else
    puts "else..."
  ensure
    puts "ensure..."
  end

  puts "end test."
end

10.times do
  test(rand(10))
end
