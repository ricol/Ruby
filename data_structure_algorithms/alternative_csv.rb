#!/usr/bin/env ruby

# Alternative 2 using method_missing on CsvRow
module ActsAsCsv
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def acts_as_csv
      include InstanceMethods
    end
  end

  module InstanceMethods
    attr_accessor :headers, :csv_contents

    def initialize(rows)
      first, *rest = rows
      @headers = first.split(", ")
      @csv_contents = rest.map do |row|
        row_arr = row.split(", ")
        row_hash = row_arr.each.with_index.each_with_object({}) do |(value, i), memo|
          memo[@headers[i]] = value
        end
        CsvRow.new(row_hash)
      end
    end
  end
end

class CsvRow
  attr_accessor :values

  def initialize(values)
    @values = values
  end

  def method_missing(name, *_args)
    @values[name.to_s]
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv

  def each
    @csv_contents.each { |row| yield row }
  end
end

lines = [
  "one, two",
  "lions, tigers",
]
csv = RubyCsv.new(lines)
csv.each { |row| puts row.one }
