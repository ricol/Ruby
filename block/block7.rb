#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

def show_block
  if block_given?
    puts "run the block..."
    yield
  else
    puts "show_block: no block."
  end
end

def run_block
  yield
rescue StandardError
  puts "run_block: no block."
end

show_block
show_block { puts "hello, this is a block" }
show_block { puts "hi, this is another block." }
show_block

run_block
run_block { puts "hello, this is a block" }
run_block { puts "hi, this is another block." }
run_block
