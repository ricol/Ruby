#!/usr/local/bin/ruby

class Person
  def initialize(name, message)
    @name = name
    @message = message
  end

  def printInfo
    print "person name: #{@name}\n"
  end

  def hello
    print "#{@name} say: #{@message}\n"
  end
end

me = Person.new("wangxinghe", "hi Ruby from wangxinghe!")
me.printInfo
me.hello

me = Person.new("ricolwang", "hi Ruby from ricolwang!")
me.printInfo
me.hello
