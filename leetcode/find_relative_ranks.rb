#!/usr/bin/env ruby

# @param {Integer[]} score
# @return {String[]}
def find_relative_ranks(score)
  def rank(n)
    return "Gold Medal" if n == 0
    return "Silver Medal" if n == 1
    return "Bronze Medal" if n == 2
    return "#{n + 1}"
  end
  result = []
  sorted = score.sort.reverse
  for i in 0...score.count
    for j in 0...sorted.count
      if score[i] == sorted[j]
        result << rank(j) 
        break
      end
    end
  end
  return result
end

for i, r in {[5,4,3,2,1] => ["Gold Medal","Silver Medal","Bronze Medal","4","5"], [10,3,8,9,4] => ["Gold Medal","5","Bronze Medal","Silver Medal","4"]}
  a = find_relative_ranks(i)
  puts "input: #{i}, expected: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
