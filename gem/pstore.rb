#!/usr/bin/env ruby

require "pstore"

class T
  def initialize(val, left = nil, right = nil)
    @val, @left, @right = val, left, right
  end

  def to_a
    [@val, @left.to_a, @right.to_a]
  end
end

store = PStore.new("/tmp/store")
store.transaction do
  store["names"] = ["Douglas", "Barenberg", "Meyer"]
  store["tree"] = T.new("top",
                        T.new("A", T.new("B")),
                        T.new("C", T.new("D", nil, T.new("E"))))
end

# now read it back in

store.transaction do
  puts "Roots: #{store.roots.join(", ")}"
  puts store["names"].join(", ")
  puts store["tree"].to_a.inspect
end
