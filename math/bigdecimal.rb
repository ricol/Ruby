#!/usr/bin/env ruby

require "bigdecimal"

dime = BigDecimal("0.1")
d = 0.1
p "case float/double: %s" % (4 * d - 3 * d == d)
p "case BigDecimal: %s" % (4 * dime - 3 * dime == dime)

BigDecimal.mode(BigDecimal::ROUND_MODE, BigDecimal::ROUND_HALF_EVEN)
BigDecimal.limit(20)
principal = BigDecimal("200000")
apr = BigDecimal("6.5")
years = 30
payments = years * 12
interest = apr / 100 / 12
x = (interest + 1) ** payments
monthly = (principal * interest * x) / (x - 1)
p monthly
monthly = monthly.round(2)
p monthly
monthly = monthly.to_s("f")
p monthly

a = 0.9
printf("a = %.50f\n", a)
b = 0.8
printf("b = %.50f\n", b)
printf("a - b = %.50f\n", a - b)
puts "a == b + 0.1 ? #{a == b + 0.1}"
puts "a > b + 0.1 ? #{a > b + 0.1}"
puts "a < b + 0.1 ? #{a < b + 0.1}"
puts "demo..."
s = "0.123456789"
puts "#{s}, ROUND_UP ->  #{BigDecimal(s).round(2, BigDecimal::ROUND_UP)}"
puts "#{s}, ROUND_DOWN ->  #{BigDecimal(s).round(2, BigDecimal::ROUND_DOWN)}"
puts "#{s}, ROUND_HALF_EVEN ->  #{BigDecimal(s).round(4, BigDecimal::ROUND_HALF_EVEN)}"
puts "#{s}, ROUND_HALF_UP ->  #{BigDecimal(s).round(4, BigDecimal::ROUND_HALF_UP)}"
puts "#{s}, ROUND_HALF_DOWN ->  #{BigDecimal(s).round(4, BigDecimal::ROUND_HALF_DOWN)}"
