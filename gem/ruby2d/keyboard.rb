#!/usr/bin/env ruby

require "ruby2d"

on :key do |event|
  # All keyboard interaction
  puts event
end

on :key_down do |event|
  # A key was pressed
  puts event.key
end

on :key_held do |event|
  # A key is being held down
  puts event.key
end

on :key_up do |event|
  # A key was released
  puts event.key
end

show
