#!/usr/bin/env ruby

# @param {String} a
# @param {String} b
# @return {Integer}
def find_lu_slength1(a, b)
  return a.size > b.size ? a.size : b.size if a.size != b.size
  hash = {}
  # puts "a: #{a}, b: #{b}"
  for i in 0...a.size
    for j in a.size.step(0, -1)
      for m in 0...b.size
        for n in b.size.step(0, -1)
          next if j - i + 1 < 1 || n - m + 1 < 1
          aa = a[i, j - i + 1]
          bb = b[m, n - m + 1]
          # puts "aa: #{aa}, bb: #{bb}"
          next if hash[bb] || hash[aa]
          hash[aa] = true
          hash[bb] = true
          return aa.size if aa != nil && bb != nil && aa != bb && aa.size == bb.size
        end
      end
    end
  end
  return -1
end

def find_lu_slength2(a, b)
  return a.size > b.size ? a.size : b.size if a.size != b.size
  # puts "a: #{a}, b: #{b}"
  for i in 0...a.size
    for j in a.size.step(0, -1)
      for m in 0...b.size
        for n in b.size.step(0, -1)
          next if j - i + 1 < 1 || n - m + 1 < 1
          next if j - i + 1 != n - m + 1
          aa = a[i, j - i + 1]
          bb = b[m, n - m + 1]
          next if aa.size != bb.size
          # puts "aa: #{aa}, bb: #{bb}"
          return aa.size if aa != bb && aa.size == bb.size
        end
      end
    end
  end
  return -1
end

#this is correct program. but the question is silly
def find_lu_slength(a, b)
  return a.size > b.size ? a.size : b.size if a.size != b.size
  return a.size if a != b
  -1
end

for i, r in {
  ["aba", "cdc"] => 3,
  ["aaa", "bbb"] => 3,
  ["aaa", "aaa"] => -1,
  ["aefawfawfawfaw", "aefawfeawfwafwaef"] => 17,
  ["aweffwaf", "aweffwaf"] => -1,
}
  a = find_lu_slength(i.first, i.last)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? "pass" : "fail"}"
end
