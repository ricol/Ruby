#!/usr/bin/env ruby

require "find"
Find.find("/etc/passwd", "/var/spool/lp1", ".") do |f|
  Find.prune if f == "."
  puts f
end
