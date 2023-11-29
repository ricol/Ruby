#!/usr/bin/env ruby

# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
class Array
  def sum
    total = 0
    each do |value|
      total += value
    end
    total
  end
end

class Prices
  def initialize(*data)
    @data = data
  end

  def get
    @data[rand(@data.size)]
  end

  def each(count)
    count.times do
      yield get
    end
  end
end

class ChangeMaker
  def initialize(*coins)
    raise "ChnageMaker must have a coin of demonimation 1" unless coins.include?(1)
    @coins = coins.sort
    @cache = {}
  end

  def change(amount)
    return @cache[amount] if @cache[amount]
    return [] if amount == 0
    possible = @coins.find_all do |coin|
      coin <= amount
    end
    best = possible.min_by do |coin|
      change(amount - coin).size
    end
    @cache[amount] = [best, *change(amount - best)].sort
    @cache[amount]
  end
end

class Customer
  attr_reader :denoms, :coins

  def initialize(denoms, *coins)
    @coins = coins.sort
    @denoms = denoms.sort
    coins.each do |denom|
      check_denom(denom)
    end
    @cm = ChangeMaker.new(*@denoms)
    check_optimal_start
  end

  def check_denom(denom)
    raise "Bad denomination #{denom}" unless denoms.include?(denom)
  end

  def check_optimal_start
    optimal = @cm.change(amount)
    if coins.size != optimal.size
      raise "Bad starting state #{coins.inspect} should be #{optimal.inspect}"
    end
  end

  def amount
    coins.sum
  end

  def number
    coins.size
  end

  def self.us(*coins)
    new([1, 5, 10, 25], *coins)
  end

  def ==(other)
    return false unless other.is_a?(Customer)
    return false unless coins == other.coins
    return false unless denoms == other.denoms
    true
  end

  def to_s
    dollars = format("$%.2f", amount.to_f / 100)
    "#{dollars} (#{coins.join(", ")}"
  end

  def take!(coin)
    coins.push coin
    coins.sort!
  end

  def give!(coin)
    raise "Don't have #{coin} coin to give" unless coins.include?(coin)
    coins.delete_at(coins.index(coin))
  end

  def pay!(bill)
    give = coins.permutations.min_by do |perm|
      amount = (perm.sum - bill) % 100
      change = @cm.change(amount)
      number - perm.size + change.size
    end
    amount = (give.sum - bill) % 100
    get = @cm.change(amount)
    give.each do |d|
      give!(d)
    end
    get.each do |d|
      take!(d)
    end
  end
end

module Enumerable
  @@permutations_cache = {}

  def permutations
    return @@permutations_cache[self].dup if @@permutations_cache[self]
    return [[]] if empty?
    others = rest.permutations
    (@@permutations_cache[dup] = (others.map do |o|
      [first] + o
    end + others).uniq).dup
  end

  def rest
    return [] if empty?
    self[1..-1]
  end

  def permutations_of_size(n)
    perms = [[]]
    each do |item|
      add = []
      perms.each do |prev|
        newone = prev + [item]
        add.push newone if newone.size <= n
      end
      add.each do |data|
        perms << data
      end
      perms.uniq!
    end
    perms.find_all do |p|
      p.size == n
    end
  end
end

def test(*data, time)
  puts "Testing in money system: #{data}"
  cm = ChangeMaker.new(*data)
  time.times do
    num = rand(100)
    data = cm.change(num)
    puts "#{num} => #{data}"
  end
end

class ChangeSimulator
  def initialize(prices, *denoms)
    @prices = prices
    @customer = Customer.new(denoms)
  end

  def run(length)
    sum = 0
    @prices.each(length) do |bill|
      @customer.pay!(bill)
      sum += @customer.number
    end
    sum.to_f / length
  end
end

test(1, 5, 10, 25, 50, 100, 10)
test(1, 7, 10, 20, 50, 100, 10)
puts "simulating...1"
price_list = []
num = 1000
num.times do
  price = rand(num) + 1
  price_list << price
end
prices = Prices.new(*price_list)
sim = ChangeSimulator.new(prices, 1, 2, 5, 10, 25, 50, 100, 200, 500, 1000)
puts sim.run(num)
puts "simulating...2"
possibilities = []
us_denoms = [5, 10, 25]
us_denoms.size.times do |i|
  (2..99).each do |replacement|
    denoms = us_denoms.dup
    denoms[i] = replacement
    possibilities << [1, *denoms]
  end
end
winner = possibilities.min_by do |denoms|
  sim = ChangeSimulator.new(prices, *denoms)
  sim.run(num)
end
puts "The winner is: #{winner.sort.inspect}"
puts "simulating...3"
winner = (2..99).min_by do |extra|
  sim = ChangeSimulator.new(prices, 1, 5, 10, 25, extra)
end
puts "The winner is: #{winner}"
puts "simulating...4"
num = 2
purchases = 400
choices = (2..99).to_a.permutations_of_size(num - 1).map do |p|
  p.push(1)
end
winner = choices.min_by do |denoms|
  sim = ChangeSimulator.new(prices, *denoms)
  sim.run(purchases)
end
puts "The winner is : #{winner.sort.inspect} for #{num} coin system."
puts "end simulation."
