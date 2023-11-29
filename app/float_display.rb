#!/usr/bin/env ruby

str = %w[1.01 1.02 1.03 1.04 1.05 1.06 1.07 1.08 1.09 1.10 1.11 1.12 1.13 1.14 1.15 1.16 1.17 1.18 1.19 1.20 1.21 1.22 1.23 1.24 1.25 1.26 1.27 1.28 1.29 1.30]
str.each do |value|
  num = value.to_f
  num *= 100
  print format("%s -> %.0f", value, num) + " [" + "#{value} -> #{num}]\n"
end
