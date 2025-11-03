#!/usr/bin/env ruby

# @param {Integer[]} candy_type
# @return {Integer}
def distribute_candies(candy_type)
  hash = {}
  for i in candy_type
    hash[i] = 1 if hash[i].nil?
  end
  return hash.keys.count < candy_type.count / 2 ? hash.keys.count : candy_type.count / 2
end

for i, r in {[1,1,2,2,3,3] => 3, [1,1,2,3] => 2, [6,6,6,6] => 1}
  a = distribute_candies(i)
  puts "input: #{i}, output: #{a}, expected: #{r} -> #{a == r ? 'pass' : 'fail'}"
end
