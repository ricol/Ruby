#!/usr/local/bin/ruby

require "../math/fact.rb"
require "benchmark"
include Benchmark

FUNC_OF_FILE = {
  "factorial" => "fact",
  "fibonacci" => "fib",
  "Fib" => "fibonacci",
}.freeze

UPPER_OF_FILE = {
  "factorial" => 200,
  "fibonacci" => 30,
  "Fib" => 30,
}.freeze

["factorial", "fibonacci", "Fib"].each do |file|
  (10..50).to_a.each do |num|
    upper = UPPER_OF_FILE[file]
    bm do |test|
      test.report("#{num}.#{file}") do
        upper.send(FUNC_OF_FILE[file])
      end
    end
  end
end
