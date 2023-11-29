#!/usr/bin/env ruby

name = "ricol wang"
age = 32
jobTitle = "iOS programmer"
b = true
number = 1
floatnumber = 1.2
character = "a"
puts "welcome #{name}!\nage: #{age}\njob: #{jobTitle}" + "\ndetails:\nname: #{name}\nage: #{age}\njob: #{jobTitle}"
puts "name.class: #{name.class}\nage.class: #{age.class}\nb.class: #{b.class}\nnumber.class: #{number.class}\nfloatnumber.class: #{floatnumber.class}\ncharacter.class: #{character.class}"
puts "" "
ricol wang, welcome to Ruby world!
wish you will have a wanderful trip about studing Ruby programming!
It is interesting, isn't it?
that's all for this lesson.
bye.
" ""
puts "this marks the end of the lesson!\n"

class Ambiguous
  def x; 1; end

  def test
    puts x #1
    x = 0 if false
    puts x #nil
    x = 2
    puts x #2
  end
end

Ambiguous.new().test
