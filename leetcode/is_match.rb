#!/usr/bin/env ruby

def is_match(s, p)
  previous_s = nil
  previous_p = nil
  pass = false
  more = false
  i = 0
  j = 0
  loop do
    puts "checking... s[#{i}] = #{s[i]}, p[#{j}] = #{p[j]}"
    pass = false
    more = false
    if p[j] == "."
      previous_s = s[i]
      previous_p = p[j]
      i += 1
      j += 1
      more = true if i < s.length || j < p.length
      pass = true
      puts "1...i: #{i}, j: #{j}"
    elsif p[j] == "*"
      if previous_p == "."
        previous_s = s[i]
        i += 1
        more = true if i < s.length
        pass = true
        puts "2...i: #{i}, j: #{j}"
      elsif previous_p == s[i]
        previous_s = s[i]
        i += 1
        more = true if i < s.length
        pass = true
        puts "3...i: #{i}, j: #{j}"
      else
        previous_s = s[i]
        previous_p = p[j]
        i += 1
        j += 1
        more = true if j < p.length || j < s.leng
        pass = true
        puts "4...i: #{i}, j: #{j}"
      end
    elsif p[j] == s[i]
      puts "5...i: #{i}, j: #{j}"
      previous_s = s[i]
      previous_p = p[j]
      pass = true
      i += 1
      j += 1
      more = true if i < s.length || j < p.length
    else
      puts "6[fail]...i: #{i}, j: #{j}"
      break
    end
    break if !pass || !more || i >= s.length || j >= p.length
  end
  puts "pass: #{pass}, i: #{i}, s.length-1: #{s.length - 1}, j: #{j}, p.length-1: #{p.length - 1}"
  return pass && !more
end

for (i, a) in { ["aa", "a."] => true,
               ["aa", "a*"] => true,
               ["aabaa", "a.ba*"] => true,
               ["aa", "a"] => false,
               ["ab", ".*"] => true,
               ["aab", "c*a*b"] => true }
  r = is_match(i.first, i.last)
  puts "input: #{i}, expect: #{a}, actual: #{r} -> #{a == r ? "pass" : "fail"}"
end
