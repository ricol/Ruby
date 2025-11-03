#!/usr/bin/env ruby

# @param {Integer} n
# @param {Integer} k
# @return {Integer[][]}
def combine(n, k)
  def select(data, k)
    if k == 1
      all = []
      for d in data
        all << [d]
      end
      return all
    end
    all = []
    for i in data
      copy = data.dup
      copy.delete(i)
      others = select(copy, k - 1)
      for o in others
        all << (o + [i]).sort!
      end
    end
    return all.uniq
  end

  return select((1..n).to_a, k)
end

require "set"

for input, result in { [4, 2] => [
  [2, 4],
  [3, 4],
  [2, 3],
  [1, 2],
  [1, 3],
  [1, 4],
], [1, 1] => [[1]] }
  myresult = combine(input.first, input.last)
  puts "input: #{input}, my result: #{myresult}, result: #{result} -> #{Set.new(myresult) == Set.new(result) ? "pass" : "fail"}"
end
