#!/usr/bin/env ruby

def proc_builder(message)
  p = Proc.new { puts message }
  puts "proc_builder...end."
  return p
end

def proc_builder_with_return(message)
  p = Proc.new { puts message; return }
  puts "proc_builder...end."
  return p
end

def test
  puts "entering method..."
  p = proc_builder("entering proc...")
  p.call
  puts "exiting method..."
  begin
    p = proc_builder_with_return("entering proc with return...")
    p.call
  rescue => exception
    puts "exception: #{exception}"
  ensure
    puts "end"
  end
end

test
puts "done"
