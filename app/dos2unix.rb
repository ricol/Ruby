#!/usr/bin/env ruby

puts "ARGV: #{ARGV}"
puts "converting..."
ARGV.each do |filename|
  contens_file = File.open(filename, "r")
  contents = contens_file.read
  contens_file.close
  contents.gsub!(/\r\n?/, '\n')
  replace_file = File.new(filename, "w+")
  replace_file.puts(contents)
  replace_file.close
end
puts "done."
