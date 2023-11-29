#!/usr/bin/env ruby

require "find"

puts "calculating..."
STDOUT.flush
$level = 0
$files = 0
$directories = 0

def print_info(path)
  Find.find(path) do |f|
    if File.file?(f)
      $files += 1
      print " " * $level + "#{f}\n"
    elsif File.directory?(f)
      $directories += 1
      print " " * $level + "#{f}\n"
      if f != path
        $level += 1
        print_info(f)
        $level -= 1
      end
    end
  end
end

print_info(".")
puts "total: #{$files} files and #{$directories} directories"
