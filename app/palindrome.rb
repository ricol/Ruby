#!/usr/bin/env ruby

class String
  DUAL_CASE_ALPHABET = ("a".."z").to_a + ("A".."Z").to_a

  def palindrome?(case_matters = true)
    letters_only(case_matters) == letters_only(case_matters).reverse
  end

  def letters_only(case_matters = false)
    just_letters = split("").find_all do |char|
      DUAL_CASE_ALPHABET.include?(char)
    end.join("")
    return just_letters if case_matters
    just_letters.downcase
  end
end

puts "Band\tPal?\tPal?:"
bands = %w[abba Abba asia Asia]
bands.each do |band|
  puts "#{band}\t#{band.palindrome?}\t#{band.palindrome?(false)}"
end
