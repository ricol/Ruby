#!/usr/bin/env ruby

all_taxable_prices = 30
all_none_taxable_prices = 20
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
total_discounts = discounts_on_allTaxable + discounts_on_allNoneTaxable
subtotal_after_discount = subtotal - total_discounts

tax = (all_taxable_prices - discounts_on_allTaxable) * tax_rate
surcharge = subtotal_after_discount * surcharge_rate
total = subtotal_after_discount + tax + surcharge

puts "=" * 30
puts "subtotal: $#{subtotal}"
puts "discounts: -$#{total_discounts}($#{flat_discounts.sum} + $#{subtotal * percent_discount})"
puts "tax: $#{tax}"
puts "surcharge: $#{surcharge}"
puts "total: $#{total}"
