#!/usr/bin/env ruby

def proc_builder(message)
  p = Proc.new { puts message; return }
  puts "proc_builder...end."
  return p
end

def test
  puts "entering method..."
  p = proc_builder("entering proc...")
  p.call
  puts "exiting method..."
end

test
puts "done"
