#!/usr/bin/env ruby

require "find"

unless ARGV.length > 0
  puts "fileTree.rb <path>"
  exit 0
end

Find.find(ARGV.first) do |f|
  type = case
    when File.file?(f) then "F"
    when File.directory?(f) then "D"
    else "?"
    end
  puts "#{type}: #{f}"
end
