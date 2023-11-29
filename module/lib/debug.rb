#!/usr/bin/env ruby

module BaseModule
  def data
    if @name == nil
      return @name = "undefined"
    else
      return @name
    end
  end

  def set_data(s)
    @name = s
  end
end

module Debug
  include BaseModule

  def who_am_i
    return "[Class: #{self.class} Name: #{data}]"
  end
end

module Debug1
  include BaseModule

  def who_am_i
    return "[Class: #{self.class} Name: #{data}]"
  end
end

class Person
  include Debug1
end

a_person = Person.new
puts a_person.who_am_i
a_person.set_data("wangxinghe")
puts a_person.who_am_i
a_person.set_data("ricolwang")
puts a_person.who_am_i
a_person.set_data(nil)
puts a_person.who_am_i
puts "debug.rb end."
