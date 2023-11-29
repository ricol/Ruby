#!/usr/bin/env ruby

require "ruby2d"

# Using the DSL
get :mouse_x
get :mouse_y

# Or using the `Window` class
Window.mouse_x
Window.mouse_y

on :mouse do |event|
  # A mouse event occurred
  puts event
end

on :mouse_down do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  # Read the button event
  case event.button
  when :left
    # Left mouse button pressed down
  when :middle
    # Middle mouse button pressed down
  when :right
    # Right mouse button pressed down
  end
end

on :mouse_up do |event|
  # x and y coordinates of the mouse button event
  puts event.x, event.y

  # Read the button event
  case event.button
  when :left
    # Left mouse button released
  when :middle
    # Middle mouse button released
  when :right
    # Right mouse button released
  end
end

on :mouse_scroll do |event|
  # Change in the x and y coordinates
  puts event.delta_x
  puts event.delta_y
end

on :mouse_move do |event|
  # Change in the x and y coordinates
  puts event.delta_x
  puts event.delta_y

  # Position of the mouse
  puts event.x, event.y
end
on :mouse_move do |event|
  # Change in the x and y coordinates
  puts event.delta_x
  puts event.delta_y

  # Position of the mouse
  puts event.x, event.y
end

show
