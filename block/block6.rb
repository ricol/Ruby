#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

def make_proc(&b)
  b
end

sum1 = make_proc { |a, b| a + b }

sum2 = proc { |a, b| a + b }

puts "sum1: #{sum1.call(2, 3)}"
puts "sum2: #{sum2.call(2, 3)}"
puts "sum1: #{sum1[2, 3]}"
puts "sum2: #{sum2[2, 3]}"

def lambda_builder(message)
  -> { puts message; return }
end

def proc_builder(message)
  proc { puts message }
end

def test
  def test_lambda
    puts "testing lamda..."
    puts "entering method..."
    l = lambda_builder("entering lambda...")
    l.call
    puts "exiting methods."
  end

  def test_block
    puts "testing proc..."
    puts "entering method..."
    l = proc_builder("entering proc...")
    l.call
    puts "exiting methods."
  end

  test_lambda
  test_block
end

test
