#!/usr/bin/env ruby

file = File.open("/etc/hosts")
begin
  content = file.read
  puts "content: #{content} : #{content.class}"
  content = file.gets
  puts "content: #{content} : #{content.class}"

  begin
    content = file.readline
    puts "content: #{content} : #{content.class}"
  rescue Exception => e
    puts "exception: #{e}"
  end
rescue => exception
ensure
  file.close
end
