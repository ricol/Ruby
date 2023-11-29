#!/usr/bin/env ruby

class BasicObject
  def info
    puts "class: #{self.class}, value: #{self}"
  end
end

alias print info

1.print
"a".print
"a".print
"abc".print
1.232.print
true.print
false.print
nil.print

undef print
alias print info

1.print
"a".print
"a".print
"abc".print
1.232.print
true.print
false.print
nil.print
