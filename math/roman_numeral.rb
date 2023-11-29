#!/usr/bin/env ruby

class Integer
  ARABIC_TO_ROMAN = {
    1000 => "M",
    500 => "D",
    100 => "C",
    50 => "L",
    10 => "X",
    5 => "V",
    1 => "I",
    0 => "",
  }.freeze
  SUBTRACTIVE_TO_ROMAN = {
    900 => "CM",
    400 => "CD",
    90 => "XC",
    40 => "XL",
    9 => "IX",
    4 => "IV",
  }.freeze
  SUBTRACTIVE = true

  def to_roman
    @@roman_of ||= create_roman_of
    return "" unless self > 0
    return to_s if self > maximum_representable
    base = @@roman_of.keys.sort.reverse.detect { |k| k <= self }
    return "" unless base && (base > 0)
    (@@roman_of[base] * round_to_base(base)) + (self % base).to_roman
  end

  def create_roman_of
    return ARABIC_TO_ROMAN unless SUBTRACTIVE
    ARABIC_TO_ROMAN.merge(SUBTRACTIVE_TO_ROMAN)
  end

  def maximum_representable
    (@@roman_of.keys.max * 5) - 1
  end

  def round_to_base(base)
    (self - (self % base)) / base
  end
end

(ARGV[0].to_i..ARGV[1].to_i).each do |n|
  puts "#{n} => #{n.to_roman}"
end
