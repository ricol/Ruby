#!/usr/bin/env ruby

class CurrencyConverter
  BASE_ABBR_AND_NAME = { "USD" => "US Dollar" }.freeze
  FULLNAME_OF = {
    "EUR" => "Euro",
    "CAD" => "Canadian Dollar",
    "CNY" => "Chinese Yuan",
    "INR" => "Indian Rupee",
    "MXN" => "Mexican Peso",
  }.freeze
  EXCHANGE_RATES = {
    "EUR" => (rand(10) / 10.0),
    "INR" => (rand(10) / 10.0),
    "CNY" => (rand(10) / 10.0),
    "MXN" => (rand(10) / 10.0),
    "CAD" => (rand(10) / 10.0),
  }.freeze

  def initialize
    @base_currency = BASE_ABBR_AND_NAME.keys[0]
    @name = BASE_ABBR_AND_NAME[@base_currency]
  end

  def output_rates(mult = 1)
    get_value(mult, get_rates) + "\n"
  end

  private

  def get_rates
    EXCHANGE_RATES
  end

  def get_value(mult, rates)
    pluralize(mult, @name) + " (#{@base_currency}) = \n" +
      rates.keys.map do |abbr|
        "\t" +
          pluralize(mult * rates[abbr], FULLNAME_OF[abbr]) + "(#{abbr})"
      end.join("\n")
  end

  def pluralize(num, term)
    num == 1 ? "#{num} #{term}" : "#{num} #{term}s"
  end
end

a = CurrencyConverter.new
(1..10).each do |x|
  puts "#{x}: output: #{a.output_rates(x)}"
end
