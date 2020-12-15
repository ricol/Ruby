#!/usr/bin/env ruby

# Alternative 1 using method_missing on Hash
class Hash
  def method_missing(name, *_args)
    self[name.to_s]
  end
end

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
        row.split(", ")
      end
    end

    def each
      @csv_contents.each do |row|
        yield Hash[@headers.zip row]
      end
    end
  end
end

class RubyCsv
  include ActsAsCsv
  acts_as_csv
end

lines = [
  "one, two",
  "lions, tigers",
]
csv = RubyCsv.new(lines)
csv.each { |row| puts row.one }
