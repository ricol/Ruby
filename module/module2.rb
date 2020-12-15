#!/usr/bin/env ruby

module MyModule
  def self.infor
    puts "Using module..."
  end

  def self.max(i, j)
    i > j ? i : j
  end

  def self.min(i, j)
    i > j ? j : i
  end

  def self.equal(i, j)
    i == j
  end
end
