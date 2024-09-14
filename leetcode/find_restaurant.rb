#!/usr/bin/env ruby

# @param {String[]} list1
# @param {String[]} list2
# @return {String[]}
def find_restaurant(list1, list2)
  hash = {}
  list1.each_with_index do |value, index|
    hash[value] = index if !hash[value]
  end
  min = list1.count + list2.count
  result = []
  list2.each_with_index do |value, index|
    if hash[value]
      if hash[value] + index < min
        min = hash[value] + index 
        result = [value]
      elsif hash[value] + index == min
        result << value
      end
    end
  end
  return result
end

for i, r in {
  [["Shogun","Tapioca Express","Burger King","KFC"], 
  ["Piatti","The Grill at Torrey Pines","Hungry Hunter Steakhouse","Shogun"]] => ["Shogun"],
  [["Shogun","Tapioca Express","Burger King","KFC"], ["KFC","Shogun","Burger King"]] => ["Shogun"],
  [["happy","sad","good"], ["sad","happy","good"]] => ["sad","happy"],
  [["Shogun","Tapioca Express","Burger King","KFC"], ["KFC","Shogun","Burger King"]] => ["Shogun"]}
  a = find_restaurant(i.first, i.last)
  puts "input: #{i}, expect: #{r}, actual: #{a} -> #{r == a ? 'pass' : 'fail'}"
end
