#!/usr/bin/env ruby

# @param {Integer[]} bills
# @return {Boolean}
def lemonade_change1(bills)
  coins = []
  price = 5
  mapping = {5 => [[5]], 15 => [[5, 5, 5], [5, 10]]}
  bills.each_with_index do |v, index|
    coins << v
    changes = v - price
    if changes > 0
      bSolved = false
      for change in mapping[changes]
        break if bSolved
        set = []
        for c in change
          for i in 0...coins.count
            if coins[i] == c && !set.include?(i)
              set << i
              break
            end
          end
        end
        if change.count == set.count
          for s in set
            coins.delete_at(s)
          end
          bSolved = true
        end
      end
      return false if !bSolved
    end
  end
  return true    
end

def lemonade_change(bills)
  coins = []
  bills.each_with_index do |money, index|
    coins.sort!
    puts "coins: #{coins}"
    change = money - 5
    puts "change: #{change}"
    while change > 0
      change -= coins.first
      return false if change < 0
      coins.delete_at(0)
    end
    coins << money
  end
  return true
end

for i, r in {
  [5,5,5,10,20] => true, 
  [5,5,10,10,20] => false, 
  [5,5,5,5,20,20,5,5,20,5] => false, 
  [5,5,5,5,10,5,20,10,5,5] => true,
  [5,5,5,20,5,5,5,10,20,5,10,20,5,20,5,10,5,5,5,5] => false}
  a = lemonade_change(i)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end

__END__
5 -> 5
5 -> 5, 5
5 -> 5, 5, 5
10 -> [5] -> 5, 5, 10
20 -> [5, 5, 5], [5, 10] -> 5, 20

5 -> 5
5 -> 5, 5
10 -> [5] -> 5, 10
10 -> [5] -> 10, 10
20 -> [5, 5, 5], [5, 10] -> ?

5 -> 5
5 -> 5, 5
5 -> 5, 5, 5
5 -> 5, 5, 5, 5
10 -> [5] -> 5, 5, 5, 10
5 -> 5, 5, 5, 5, 10
20 -> [5, 5, 5], [5, 10] -> 5, 10, 20
10 -> [5] -> 10, 10, 20
