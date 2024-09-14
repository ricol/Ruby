#!/usr/bin/env ruby

# @param {String} sentence
# @return {String}
def to_goat_latin(sentence)
	result = []
	words = sentence.split()
	words.each_with_index do |word, index|
		chars = word.chars
		first = chars.first.downcase
		if ['a', 'e', 'i', 'o', 'u'].include?(first)
			w = chars + ['m', 'a']
			w += ['a' * (index + 1)]
			result << w.join
		else
			w = chars[1, chars.size - 1] + chars[0, 1] + ['m', 'a']
			w += ['a' * (index + 1)]
			result << w.join
		end
	end
  return result.join(" ")
end

for i, r in {"I speak Goat Latin" => "Imaa peaksmaaa oatGmaaaa atinLmaaaaa", "The quick brown fox jumped over the lazy dog" => "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"}
  a = to_goat_latin(i)
  puts "input: #{i}, expected: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
