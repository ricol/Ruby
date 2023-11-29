#!/usr/bin/env ruby

require "open-uri"

tries = 0
url = "http://www.china11.com"
begin
  tries += 1
  puts "[#{tries}]accessing #{url}..."
  open(url) { |f| puts f.readlines }
rescue Exception => e
  puts e.message
  if (tries < 4)
    sleep(2 ** tries)
    retry
  end
end
