#!/usr/bin/env ruby

require "ruby2d"

Image.new(
  File.dirname(__FILE__) + "/star.png",
  x: 400, y: 200,
  width: 50, height: 25,
  color: [1.0, 0.5, 0.2, 1.0],
  rotate: 90,
  z: 10,
)

show
