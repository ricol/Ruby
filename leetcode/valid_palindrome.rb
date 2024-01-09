#!/usr/bin/env ruby

# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  puts "s: #{s}..."
	chars = s.chars
  data = []
  chars.each_with_index do |value, index|
    data << "#{value}(#{index})"
  end
  puts data.join
  i = 0
  j = chars.count - 1
  m = chars.count / 2
  changed = false
  while i <= m && j >= m
    if chars[i] != chars[j]
      if changed
        puts "changed already. failed at #{chars[i]}(#{i}) != #{chars[j]}(#{j})"
        return false 
      end
      if chars[i + 1] != chars[j]
        if chars[i] != chars[j - 1]
          puts "#{chars[i]} != #{chars[j - 1]}"
          return false
        else
          j -= 1
          puts "adjusted j: #{j}, i: #{i}"
        end
      else
        i += 1
        puts "adjusted i: #{i}, j: #{j}"
      end
      changed = true
    end
    i += 1
    j -= 1
  end
  true
end

for i, r in {'aba' => true, 
              'abca' => true, 
              'abcab' => false, 
              'abc' => false, 
              "eeccccbebaeeabebccceea" => false,
              "eedede" => true,
              "aguokepatgbnvfqmgmlcupuufxoohdfpgjdmysgvhmvffcnqxjjxqncffvmhvgsymdjgpfdhooxfuupuculmgmqfvnbgtapekouga" => true}
	a = valid_palindrome(i)
	puts "input: #{i}, expected: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
