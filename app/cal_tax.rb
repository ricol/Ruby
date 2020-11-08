#!/usr/bin/ruby

def get_tax(salary)
	remaining = salary
	tax = 0

	if remaining > 960_000
		tax += (remaining - 960_000) * 0.45
		remaining -= 960_000
	end

	if remaining > 660_000
		tax += (remaining - 660_000) * 0.35
		remaining -= 660_000
	end

	if remaining > 420_000
		tax += (remaining - 420_000) * 0.30
		remaining -= 420_000
	end

	if remaining > 300_000
		tax += (remaining - 300_000) * 0.25
		remaining -= 300_000
	end

	if remaining > 144_000
		tax += (remaining - 144_000) * 0.20
		remaining -= 144_000
	end

	if remaining > 36_000
		tax += (remaining - 36_000) * 0.10
		remaining -= 36_000
	end

	tax += remaining * 0.03

	return tax
end

salary = ARGV.last.to_f
puts "Salary: #{salary}/year, #{salary / 12.0}/month"
tax = get_tax(salary)
puts "Tax: #{tax}/year, #{tax / 12.0}/month"
puts "Net salary: #{salary - tax}/year, #{(salary - tax) / 12.0}/month" 
