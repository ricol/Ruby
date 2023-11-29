#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
def can_win_nim(n)
  $num = n
  $myturn = true

  def go(step)
    $myturn = !$myturn
    $num -= step
    if $num <= 3
      return $myturn
    else
      return true if go(1)
      return true if go(2)
      return true if go(3)
      return false
    end
  end

  return true if go(1)
  return true if go(2)
  return true if go(3)

  false
end

for i, r in { 1 => true, 2 => true, 3 => true, 4 => false }
  result = can_win_nim(i)
  puts "input: #{i}, result: #{r} -> #{result == r ? "pass" : "fail"}"
end
