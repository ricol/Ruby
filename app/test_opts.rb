#!/usr/local/bin/ruby

require "benchmark"
include Benchmark
FUNC_OF_FILE = {
  "factorial" => "fact",
  "fibonacci" => "fib",
}.freeze
UPPER_OF_FILE = {
  "factorial" => 200,
  "fibonacci" => 30,
}.freeze
%w[factorial fibonacci].each do |file|
  require file.to_s
  upper = UPPER_OF_FILE[file]
  bm do |test|
    test.report(file.to_s) do
      upper.send(FUNC_OF_FILE[file])
    end
  end
end
