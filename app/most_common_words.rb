#!/usr/bin/env ruby

class Array
  def count_of(item)
    grep(item).size
    #inject(0) { |count, each_item| item == each_item ? count + 1 : count }
  end
end

def most_common_words(input, limit = 25)
  freq = Hash.new()
  sample = input.downcase.split(/\W/)
  sample.uniq.each do |word|
    freq[word] = sample.count_of(word) unless word == ""
  end
  words = freq.keys.sort_by do |w|
    freq[w]
  end.reverse.map do |w|
    "#{w} #{freq[w]}"
  end
  return words[0, limit]
end

puts most_common_words(readlines.to_s).join("\n")
