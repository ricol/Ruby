#!/usr/bin/env ruby

initalDeposit = 100.0
interest = 0.01
YEAR = 200
deposit = initalDeposit
newInterest = interest
puts "Initial: deposit: #{deposit}, interest: #{interest}"
$stdout.flush
(1..YEAR).each do |year|
  previous = deposit
  deposit *= (1 + interest)
  newInterest = (deposit - previous) / previous
  puts "year: #{year} money: #{deposit} -> interest: #{newInterest}"
  $stdout.flush
end
puts "-----"
puts "after #{YEAR} years, total money: #{deposit}"
puts "checking..."
puts "after #{YEAR} years, total money: #{initalDeposit * ((1 + interest) ** YEAR)}"

puts "welcome"
