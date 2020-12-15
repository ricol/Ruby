#!/usr/bin/env ruby

def queryClasses(data, criteria)
  # Create a clone of data so we don't cause side effects
  new_data = data.clone
  # Step 1: Filter
  if criteria[:filter]
    # Maps filter operator symbols to the block it should perform
    op2block = {
      gt: ->(fv, v) { !fv.nil? && fv > v },
      gte: ->(fv, v) { !fv.nil? && fv >= v },
      lt: ->(fv, v) { !fv.nil? && fv < v },
      lte: ->(fv, v) { !fv.nil? && fv <= v },
      eq: ->(fv, v) { fv == v },
      neq: ->(fv, v) { fv != v },
      exists: ->(fv, v) { (!fv.nil?) == v },
    }
    # Overall filter of the courses
    new_data = new_data.select do |course| # NOTE: select is a filter
      criteria[:filter].inject(true) do |pass, (field, operations)|
        # Now go through all sub-clauses/operations in each filter
        pass && operations.inject(true) do |inner_pass, (op, v)|
          inner_pass && op2block[op].call(course[field], v)
        end
      end
    end
  end
  # Step 2: Sort By
  if (field = criteria[:sort_by])
    has_crit = (new_data.reject { |course| course[field].nil? }).sort_by! { |course| course[field] }
    no_crit = (new_data.select { |course| course[field].nil? })
    new_data = has_crit + no_crit
  end
  # Step 3: Limit
  if (limit = criteria[:limit]) && (limit > 0) # NOTE: we use `and` here because we want assignment first
    new_data = new_data.take limit
  end
  # Step 4: Select/Projection
  if (fields = criteria[:select])
    new_data = new_data.map do |course|
      course.keep_if { |k, _v| fields.include? k }
    end
  end
  # Return transformed data
  new_data
end

def queryClasses(data, criteria)
  comparators = {
    gt: ->(value, condition) { value > condition },
    gte: ->(value, condition) { value >= condition },
    lt: ->(value, condition) { value < condition },
    lte: ->(value, condition) { value <= condition },
    eq: ->(value, condition) { value == condition },
    neq: ->(value, condition) { value != condition },
    exists: ->(value, condition) { !(value.nil? ^ condition) },
  }
  filter = criteria[:filter]
  sort_by = criteria[:sort_by]
  select = criteria[:select]
  unless filter.nil?
    data = data.select do |item|
      filter.all? do |attr, conditions|
        conditions.all? do |op, condition|
          comparators[op].call(item[attr], condition)
        end
      end
    end
  end
  unless sort_by.nil?
    data = data.sort_by do |item|
      item[sort_by]
    end
  end
  unless select.nil?
    data = data.map do |item|
      item.select do |key, _value|
        select.include?(key)
      end
    end
  end
  data[0...(criteria[:limit] || data.size)]
end

data = [{
  department: "CS",
  number: 101,
  name: "Intro to Computer Science",
  credits: 1.00,
}, {
  department: "CS",
  number: 82,
  name: "The Internet Seminar",
  credits: 0.5,
}, {
  department: "ECE",
  number: 52,
  name: "Intro to Digital Logic",
# Note that the :credits key-value pair is missing
}]
criteria = {
  filter: {
    number: {
      gt: 80,
    },
    credits: {
      gte: 0.5,
    },
  },
  select: %i[number name],
  sort_by: :number,
}
p queryClasses(data, criteria)
p data
