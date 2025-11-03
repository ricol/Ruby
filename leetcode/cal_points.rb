#!/usr/bin/env ruby

# @param {String[]} operations
# @return {Integer}
def cal_points(operations)
  data = []
  i = 0
  j = -1
  while i < operations.count
    if operations[i] == 'C'
      data.delete_at(j)
      j -= 1
    elsif operations[i] == 'D'
      data << data[j] * 2
      j += 1
    elsif operations[i] == '+'
      data << data[j] + data[j - 1]
      j += 1
    else 
      data << operations[i].to_i
      j += 1
    end
    i += 1
      # puts "#{operations[i - 1]} -> #{data}"
   end
  return data.sum
end

for i, r in {["5","2","C","D","+"] => 30, ["5","-2","4","C","D","9","+","+"] => 27, ["1","C"] => 0}
  a = cal_points(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{a == r ? 'pass' : 'fail'}"
end
