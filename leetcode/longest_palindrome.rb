#!/usr/bin/env ruby

def longest_palindrome(s)
  result = ""
  for i in 0...s.length
    l = i
    r = i
    ll = l
    rr = r
    lChanged = true
    rChanged = true
    while s[l] == s[r] and lChanged and rChanged
      lChanged = false
      rChanged = false
      ll = l
      rr = r
      if l - 1 >= 0
        l -= 1
        lChanged = true
      end
      if r + 1 < s.length
        r += 1
        rChanged = true
      end
    end
    sub = s[ll..rr]
    #puts "sub: #{sub}, i: #{i}, ll: #{ll}, rr: #{rr}"
    result = sub if sub.length > result.length

    l = i
    r = i
    ll = l
    rr = r
    if i + 1 < s.length and s[l] == s[i + 1]
      r = i + 1
      rr = r
    end
    lChanged = true
    rChanged = true
    while s[l] == s[r] and lChanged and rChanged
      lChanged = false
      rChanged = false
      ll = l
      rr = r
      if l - 1 >= 0
        l -= 1
        lChanged = true
      end
      if r + 1 < s.length
        r += 1
        rChanged = true
      end
    end
    sub = s[ll..rr]
    #puts "sub: #{sub}, i: #{i}, j: #{j}"
    result = sub if sub.length > result.length
  end
  result
end

for i, r in { "" => "", "babad" => "bab", "cbbd" => "bb", "a" => "a", "aaabaaaa" => "aaabaaa", "aaaa" => "aaaa" }
  a = longest_palindrome(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} => #{r == a ? "pass" : "fail"}"
end
