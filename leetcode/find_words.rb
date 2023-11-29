#!/usr/bin/env ruby

# @param {String[]} words
# @return {String[]}
def find_words(words)
  r1 = "qwertyuiop"
  r2 = "asdfghjkl"
  r3 = "zxcvbnm"

  r = [r1, r2, r3]
  result = []
  words.each do |word|
    r.each do |row|
      ok = true
      word.chars.each do |c|
        if !row.include?(c.downcase)
          ok = false
          break
        end
      end
      result << word if ok
    end
  end
  return result
end

for i, r in {["Hello","Alaska","Dad","Peace"] => ["Alaska","Dad"], ["omk"] => [], ["adsdf","sfd"] => ["adsdf","sfd"]}
  a = find_words(i)
  puts "input: #{i}, expected result: #{r}, actual result: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
