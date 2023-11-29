#!/usr/bin/env ruby

# if ARGV.count != 1
# 	puts "Usage: enumerate <dir>"
# 	exit
# end

# dir = ARGV.last == nil ? "." : ARGV.last
dir = "../"
puts "enumerating #{dir}..."
puts "-" * 10

def enumerate(f)
  Dir.foreach(f) do |f|
    next if f == "." or f == ".."
    if File.directory?(f)
      puts "[D] #{f}..."
      enumerate(f)
    else
      puts "[F] #{f}"
    end
  end
end

enumerate(dir)
puts "-" * 10
puts "end."
