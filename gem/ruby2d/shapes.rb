#!/usr/bin/env ruby

require "ruby2d"

Triangle.new(
  x1: 50, y1: 0,
  x2: 100, y2: 100,
  x3: 0, y3: 100,
  color: "red",
  z: 100,
)

Square.new(
  x: 100, y: 200,
  size: 125,
  color: "blue",
  z: 10,
)

Rectangle.new(
  x: 125, y: 250,
  width: 200, height: 150,
  color: "teal",
  z: 20,
)

Quad.new(
  x1: 275, y1: 175,
  x2: 375, y2: 225,
  x3: 300, y3: 350,
  x4: 250, y4: 250,
  color: "aqua",
  z: 10,
)

Line.new(
  x1: 125, y1: 100,
  x2: 350, y2: 400,
  width: 25,
  color: "lime",
  z: 20,
)

Circle.new(
  x: 200, y: 175,
  radius: 150,
  sectors: 32,
  color: "fuchsia",
  z: 10,
)

show
