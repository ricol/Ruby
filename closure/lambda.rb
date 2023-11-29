#!/usr/bin/env ruby

def test
  puts "entering method"
  p = lambda { puts "entering lambda"; return }
  p.call
  puts "exiting method"
end

test

def lambda_builder(msg)
  lambda { puts msg; return }
end

def run
  puts "entering method"
  l = lambda_builder("entering lambda")
  l.call
  puts "exiting method"
end

run

def go
  puts "entering go method..."
  l = lambda { puts "entering lambda"; break; puts "exiting lambda" }
  l.call
  puts "exiting go method"
end

go
