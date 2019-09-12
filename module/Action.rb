#!/usr/local/bin/ruby

module Action
  VERY_BAD = 0
  BAD = 1

  def self.sin(badness)
    return "sin(#{badness})"
  end
end
