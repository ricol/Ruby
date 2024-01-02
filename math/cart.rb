#!/usr/bin/env ruby

all_taxable_prices = 0
all_none_taxable_prices = 0
taxable_items = [[1, 10.00], [2, 25.00], [3, 10.00]]
non_taxable_items = [[1, 15.00], [1, 25.00], [3, 13.00]]
taxable_items.each_with_index do |item, index| 
  puts "Taxable Item #{index} -> count: #{item.first}, price: $#{item.last}"
  count = item.first
  price = item.last
  amount = count * price
  all_taxable_prices += amount
end

non_taxable_items.each_with_index do |item, index| 
  puts "NonTaxable Item #{index} -> count: #{item.first}, price: $#{item.last}"
  count = item.first
  price = item.last
  amount = count * price
  all_none_taxable_prices += amount
end

tax_rate = 0.1
surcharge_rate = 0.01
flat_discounts = [1, 5]
percent_discount = 0.3

subtotal = all_taxable_prices + all_none_taxable_prices
discounts_on_allTaxable = 0
discounts_on_allNoneTaxable = 0
if all_none_taxable_prices > 0
  half_flat_discounts = flat_discounts.sum / 2.0
  discounts_on_allTaxable = half_flat_discounts + all_taxable_prices * percent_discount
  discounts_on_allNoneTaxable = half_flat_discounts + all_none_taxable_prices * percent_discount
else
  discounts_on_allTaxable = flat_discounts.sum + all_taxable_prices * percent_discount
end
total_discounts = (discounts_on_allTaxable + discounts_on_allNoneTaxable).round(2)
subtotal_after_discount = subtotal - total_discounts

tax = ((all_taxable_prices - discounts_on_allTaxable) * tax_rate).round(2)
surcharge = (subtotal_after_discount * surcharge_rate).round(2)
total = (subtotal_after_discount + tax + surcharge).round(2)

puts "All taxable item amount: $#{all_taxable_prices}"
puts "All nontaxable item amount: $#{all_none_taxable_prices}"
puts "subtotal: $#{subtotal}(#{all_taxable_prices} + #{all_none_taxable_prices})"
puts "discounts: -$#{total_discounts}($#{flat_discounts.sum} + $#{subtotal * percent_discount})"
puts "tax: $#{tax}"
puts "surcharge: $#{surcharge}"
puts "total: $#{total}"
