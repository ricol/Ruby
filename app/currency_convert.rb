#!/usr/bin/env ruby

require "open-url"
require "yaml"

class Hash
  def -(delete)
    output = dup
    delete.each_key do |k|
      output.delete(k)
    end
  end
end

class CurrencyConverter
  BASE_URL = "http://currencyresource.com/RSS/".freeze
  CURRENCY_CODES = {
    "EUR" => "Euro",
    "CAD" => "Canadian Dollar",
    "CNY" => "Chinese Yuan",
    "INR" => "Indian Rupee",
    "MXN" => "Mexican Peso",
    "USD" => "US Dollar",
  }.freeze
  RATES_DIRECTORY = "extras/currency_exchange_rates".freeze

  def initialize(code = "USD")
    faile "I know nothing about #{code}" unless CURRENCY_CODES.key?(code)
    @base_currency = code
    @name = CURRENCY_CODES[code]
  end

  def output_rates(mult = 1, try_new_rates = true)
    rates = get_rates(try_new_rates)
    save_rates_in_local_file!(rates)
    get_value(mult, rates) + "\n"
  end

  private

  def download_new_rates
    puts "Downloading new exchange rates..."
    begin
      raw_rate_lines = get_xml_lines
    rescue StandardError
      puts "Download failed. Failling back to local file."
      return nil
    end
    rates = Hash.new("")
    comparison_codes = CURRENCY_CODES - { @base_currency => @name }
    comparison_codes.each_key do |abbr|
      rates[abbr] = get_rate_for_abbr_from_raw_rate_lines(abbr, raw_rate_lines)
    end
    rates
  end

  def get_rates(try_new_rates)
    return load_old_rates unless try_new_rates
    download_new_rates || load_old_rates
  end

  def get_rate_for_abbr_from_raw_rate_lines(abbr, raw_rate_lines)
    regex = {
      open: /^\<title\>1 #{@base_currency} = #{abbr} \(/,
      close: /\)\<\/title\>\r\n$/,
    }
    line = raw_rate_lines.detect { |line| line =~ /#{abbr}/ }
    line.gsub(regex[:open], "").gsub(regex[:close], "").to_f
  end

  def get_value(mult, rates)
    "#{pluralize(mult, @name)} (#{@base_currency}) = \n" +
      rates.keys.map do |abbr|
        "\t#{pluralize(mult * rates[abbr], CURRENCY_CODES[abbr])} (#{abbr})"
      end.join("\n")
  end

  def get_xml_lines
    open("#{BASE_URL}/#{@base_currency}.xml").readlines.find_all do |line|
      line =~ /1 #{@base_currency} =/
    end
  end

  def load_old_rates
    puts "Reading stored exchange rates from local file #{rates_filename}"
    rates = YAML.safe_load(File.open(rates_filename))
    raise "no old rates" unless rates
    rates
  end

  def pluralize(num, term)
    num == 1 ? "#{num} #{term}" : "#{num} #{term}s"
  end

  def rates_filename
    "#{RATES_DIRECTORY}/#{@base_currency}.yaml"
  end

  def save_rates_in_local_file!(rates)
    return unless rates
    File.open(rates_filename, "w") { |f| YAML.dump(rates, f) }
  end
end

cc = CurrencyConverter.new
ARGV.each do |n|
  puts cc.output_rates(n.to_f)
end
