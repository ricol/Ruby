#!/usr/bin/env ruby

require "net/http"

pages = %w(www.google.com www.opensimsim.com www.china.com)

threads = []

for page in pages
  threads << Thread.new(page) do |myPage|
    h = Net::HTTP.new(myPage, 80)
    puts "Fetching: #{myPage}"
    STDOUT.flush
    resp, data = h.get("/", nil)
    puts "Got #{myPage}: #{resp.message}"
    STDOUT.flush
  end
end

begin
  threads.each do |aThread|
    aThread.join
  end
rescue Exception => e
  puts "#{e}"
end
