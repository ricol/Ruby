#!/usr/bin/env ruby

class Array
  def matching_members(some_proc)
    find_all { |i| some_proc.call(i) }
  end
end

digits = (0..9).to_a
lambdas = Hash.new()
lambdas["five+"] = lambda { |i| i >= 5 }
lambdas["is_even"] = lambda { |i| (i % 2).zero? }
lambdas["is_odd"] = lambda { |i| not(i % 2).zero? }

lambdas.keys.sort.each do |lambda_name|
  lambda_proc = lambdas[lambda_name]
  lambda_value = digits.matching_members(lambda_proc).join(",")
  puts "#{lambda_name}\t[#{lambda_value}]\n"
end
