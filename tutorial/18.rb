#!/usr/bin/env ruby

def raise_exception
  puts "I am before the raise."
  raise "An error has occured"
  puts "I am after the raise"
end

begin
  raise_exception
rescue Exception => e
  puts e
end

def inverse(x)
  raise ArgumentError, "Argument is not numeric" unless x.is_a? Numeric
  1.0 / x
end

begin
  puts inverse(2)
  puts inverse("not a number")
rescue Exception => e
  puts e
end

begin
  File.open("MotorCycle.rb", "r") do |f1|
    while line = f1.gets
      puts line
    end
  end

  # Create a new file and write to it
  File.open("test.rb", "w") do |f2|
    # use "" for two lines of text
    f2.puts "Created by Satish\nThank God!"
  end
rescue Exception => msg
  # display the system generated error message
  puts msg
end

class Name
  # Define default getter methods, but not setter methods.
  attr_reader :first, :last
  # When someone tries to set a first name, enforce rules about it.
  def first=(first)
    if first == nil or first.size == 0
      raise ArgumentError.new("Everyone must have a first name.")
    end
    first = first.dup
    first[0] = first[0].chr.capitalize
    @first = first
  end

  # When someone tries to set a last name, enforce rules about it.
  def last=(last)
    if last == nil or last.size == 0
      raise ArgumentError.new("Everyone must have a last name.")
    end
    @last = last
  end

  def full_name
    "#{@first} #{@last}"
  end

  # Delegate to the setter methods instead of setting the instance
  # variables directly.
  def initialize(first, last)
    self.first = first
    self.last = last
  end
end

begin
  jacob = Name.new("Jacob", "Berendes")
  jacob.first = "Mary Sue"
  jacob.full_name # => "Mary Sue Berendes"
  john = Name.new("john", "von Neumann")
  john.full_name # => "John von Neumann"
  john.first = "john"
  john.first # => "John"
  john.first = nil
  # ArgumentError: Everyone must have a first name.
  Name.new("Kero, international football star and performance artist", nil)
  # ArgumentError: Everyone must have a last name.
rescue Exception => e
  puts e
end
puts
