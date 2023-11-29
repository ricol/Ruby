#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def is_happy(n)
  def getSum(n)
    # p "get sum for #{n}..."
    remaining = n
    s = 0
    while remaining > 0
      digit = remaining % 10
      s += digit * digit
      remaining /= 10
      # print("#{digit}\t")
    end
    # print("\n")
    return s
  end

  sum = n
  hash = {}
  loop do
    sum = getSum(sum)
    break if sum == 1
    hash[sum].nil? ? hash[sum] = 1 : break
  end
  return sum == 1
end

for num, result in { 19 => true, 2 => false }
  myresult = is_happy(num)
  puts "input: #{num}, my result: #{myresult}, correct result: #{result} -> #{myresult == result ? "pass" : "fail"}"
end
