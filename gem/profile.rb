#!/usr/bin/env ruby

require "profile"

def ackerman(m, n)
  if m == 0
    n + 1
  elsif n == 0 and m > 0
    ackerman(m - 1, 1)
  else
    ackerman(m - 1, ackerman(m, n - 1))
  end
end

ackerman(3, 3)
