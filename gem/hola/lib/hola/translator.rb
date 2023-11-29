#!/usr/bin/env ruby

class Translator
  def initialize(language)
    @language = language
  end

  def hi
    case @language
    when "english"
      "hello world"
    when "spanish"
      "hola mundo"
    else
      "alien language"
    end
  end
end

puts "Lib: Translator..." if __FILE__ == $0
