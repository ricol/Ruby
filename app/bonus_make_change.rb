#!/usr/bin/env ruby

def make_change(amount, coins = [25, 10, 5, 1])
  coins.sort! { |a, b| b <=> a }
  # memoize solutions
  optimal_change = Hash.new do |hash, key|
    hash[key] = if key < coins.min
        []
      elsif coins.include?(key)
        [key]
      else
        coins.
          # prune unhelpful coins
          reject { |coin| coin > key }.
          # prune coins that are factors of larger coins
          inject([]) { |mem, var| mem.any? { |c| c % var == 0 } ? mem : mem + [var] }.
          # recurse
          map { |coin| [coin] + hash[key - coin] }.
          # prune unhelpful solutions
          select { |change| change.inject { |a, b| a + b } == key }.
          # pick the smallest, empty if none
          min_by(&:size) || []
      end
  end
  optimal_change[amount]
end

def make_change2(amount, coins = [25, 10, 5, 1])
  solutions = []
  (0...coins.size).each do |offset|
    change = []
    value = amount
    coins[offset...coins.size].each do |coin|
      until value < coin
        value -= coin
        change << coin
      end
    end
    solutions << change
  end
  solutions.min_by(&:length)
end

amount = 39
p "#{amount} -> #{make_change(amount)}, -> #{make_change2(amount)}"
amount = 14
coins = [10, 7, 1]
p "#{amount} in coins: #{coins} -> #{make_change(amount, coins)}, -> #{make_change2(amount, coins)}"
