#!/usr/bin/env ruby

require "ruby2d"

t = Time.now

update do
  # Close the window after 5 seconds
  if Time.now - t > 5 then close end
end

show
