#!/usr/bin/env ruby

class String
  def num_matches(thing_to_match)
    return self.split(thing_to_match).size - 1
  end
end

BAR_LENGTH = 20
FUDGE_FACTOR = 0.82

def word_count(files)
  output = ""
  total_word_count = 0
  files.each do |filename|
    file_word_count = word_count_for_file(filename)
    output += "#{filename} has #{file_word_count} words.\n"
    total_word_count += file_word_count
  end
  return output + "-" * BAR_LENGTH + "\n" + "Total word count = #{total_word_count}" +
           " (#{(total_word_count * FUDGE_FACTOR)})"
end

def word_count_for_file(filename)
  f = File.new(filename, "r")
  contents = f.read()
  f.close()
  spaces = contents.num_matches(" ")
  breaks = contents.num_matches('\n')
  false_doubles = contents.num_matches(' \n')
  double_spaces = contents.num_matches("  ")
  hyphens = contents.num_matches("-")
  false_doubles += double_spaces + hyphens
  words = spaces + breaks - false_doubles + 1
  return words
end

puts word_count(ARGV)
