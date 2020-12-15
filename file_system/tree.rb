#!/usr/bin/env ruby

require "find"

unless ARGV.length > 0
  puts "fileTree.rb <path>"
  exit 0
end

def show(directory)
  Find.find(directory) do |f|
    if File.directory?(f)
      print "+" + " " + f + "/"
      show(f)
    end
  end
end

show(ARGV.first)
