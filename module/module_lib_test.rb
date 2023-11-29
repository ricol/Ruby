#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/lib/module_lib.rb"

MyModule.infor
puts "max(1, 2) = " + MyModule.max(1, 2).to_s
puts "min(1, 2) = " + MyModule.min(1, 2).to_s
puts "equal(1, 2) = " + MyModule.equal(1, 2).to_s
