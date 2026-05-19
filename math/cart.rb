#!/usr/bin/env ruby

puts "=" * 10 + "SIMPLE VERSION" + "=" * 10
#store all taxable items. Each item combined with its count and price.
taxable_items = [[1, 10.00], [2, 25.00], [4, 10.00], [2, 15.00]]
#store all nontaxable items.
non_taxable_items = [[1, 15.00], [1, 25.00], [3, 13.00]] 

all_taxable_prices = 0 
all_none_taxable_prices = 0
#calculate all prices(total amount) for the taxable items
taxable_items.each_with_index do |item, index|
  puts "Taxable Item #{index} -> count: #{item.first}, price: $#{item.last}"
  count = item.first
  price = item.last
  amount = count * price
  all_taxable_prices += amount
end
#calculate all prices(total amount) for the nontaxable items
non_taxable_items.each_with_index do |item, index|
  puts "NonTaxable Item #{index} -> count: #{item.first}, price: $#{item.last}"
  count = item.first
  price = item.last
  amount = count * price
  all_none_taxable_prices += amount
end

tax_rate = 0.1 #tax rate 10%
surcharge_rate = 0.01 #surcharge rate 1%
flat_discounts = [1, 5] #flat discounts
percent_discount = 0.3 #percent discount 30%

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

puts "All taxable item amount: \t$#{all_taxable_prices}"
puts "All nontaxable item amount: \t$#{all_none_taxable_prices}"
puts "subtotal: \t\t\t$#{subtotal}(#{all_taxable_prices} + #{all_none_taxable_prices})"
puts "discounts: \t\t\t-$#{total_discounts}"
puts "tax: \t\t\t\t\$#{tax}"
puts "surcharge: \t\t\t$#{surcharge}"
puts "total: \t\t\t\t$#{total}"

puts "=" * 10 + "VERBOSE VERSION" + "=" * 10
all_taxable_prices = 0
all_none_taxable_prices = 0
taxable_items = [[1, 10.00], [2, 25.00], [3, 10.00]]
non_taxable_items = [[1, 15.00], [1, 25.00], [3, 13.00]]

tax_rate = 0.1
surcharge_rate = 0.01
flat_discounts = [1, 5]
percent_discount = 0.3

num = 1
taxable_items.each_with_index do |item, index| 
  count = item.first
  price = item.last
  amount = count * price
  all_taxable_prices += amount
  puts "Item #{num} (taxable) \t count: #{count}, price: $#{price}"
  num += 1
end

non_taxable_items.each_with_index do |item, index| 
  count = item.first
  price = item.last
  amount = count * price
  all_none_taxable_prices += amount
  puts "Item #{num} (non-taxable) \t count: #{count}, price: $#{price}"
  num += 1
end

puts "All taxable item amount: \t\t$#{all_taxable_prices}"
puts "All nontaxable item amount: \t\t$#{all_none_taxable_prices}"

puts "tax rate: \t\t\t\t#{tax_rate * 100}%"
puts "surcharge rate: \t\t\t#{surcharge_rate * 100}%"
puts "percent discount: \t\t\t#{percent_discount * 100}%"
puts "float discounts: \t\t\t#{flat_discounts}"
discounts_on_allTaxable = 0
discounts_on_allNoneTaxable = 0
if all_none_taxable_prices > 0
  puts "sum of all flat discounts: \t\t$#{flat_discounts.sum}"
  half_flat_discounts = flat_discounts.sum / 2.0
  puts "half value of the sum: \t\t\t$#{half_flat_discounts} (#{flat_discounts.sum} / 2.0)"
  discounts_on_allTaxable = half_flat_discounts + all_taxable_prices * percent_discount
  discounts_on_allNoneTaxable = half_flat_discounts + all_none_taxable_prices * percent_discount
  puts "discount on all taxable items: \t\t$#{discounts_on_allTaxable} (#{half_flat_discounts} + #{all_taxable_prices} * #{percent_discount})"
  puts "discount on all non-taxable items: \t$#{discounts_on_allNoneTaxable} (#{half_flat_discounts} + #{all_none_taxable_prices} * #{percent_discount})"
else
  discounts_on_allTaxable = flat_discounts.sum + all_taxable_prices * percent_discount
  puts "discount on all taxable items: \t$#{discounts_on_allTaxable} (#{flat_discounts.sum} + #{all_taxable_prices} * #{percent_discount})"
end
total_discounts = (discounts_on_allTaxable + discounts_on_allNoneTaxable).round(2)
puts "discounts: \t\t\t\t-$#{total_discounts} ($#{discounts_on_allTaxable} + $#{discounts_on_allNoneTaxable})"
subtotal = all_taxable_prices + all_none_taxable_prices
puts "subtotal: \t\t\t\t$#{subtotal} (#{all_taxable_prices} + #{all_none_taxable_prices})"
subtotal_after_discount = subtotal - total_discounts
puts "subtotal_after_discount: \t\t#{subtotal_after_discount} (#{subtotal} - #{total_discounts})"
tax = ((all_taxable_prices - discounts_on_allTaxable) * tax_rate).round(2)
puts "tax: \t\t\t\t\t$#{tax} ((#{all_taxable_prices} - #{discounts_on_allTaxable}) * #{tax_rate})"
surcharge = (subtotal_after_discount * surcharge_rate).round(2)
puts "surcharge: \t\t\t\t$#{surcharge} (#{subtotal_after_discount} * #{surcharge_rate})"
total = (subtotal_after_discount + tax + surcharge).round(2)
puts "total: \t\t\t\t\t$#{total} (#{subtotal_after_discount} + #{tax} + #{surcharge})"
