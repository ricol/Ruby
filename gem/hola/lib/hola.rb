#!/usr/bin/env ruby

require File.dirname(__FILE__) + "/hola/translator"

class Hola
  def self.hi(language = "english")
    translator = Translator.new(language)
    translator.hi
  end
end

puts "Lib: hola..." if __FILE__ == $0
