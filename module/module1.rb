#!/usr/bin/env ruby

require "./module2.rb"

MyModule.infor
puts "max(1, 2) = " + MyModule.max(1, 2).to_s
puts "min(1, 2) = " + MyModule.min(1, 2).to_s
puts "equal(1, 2) = " + MyModule.equal(1, 2).to_s
