#!/usr/bin/env ruby

require "ruby2d"

coin = Sprite.new(
  File.dirname(__FILE__) + "/coin.png",
  clip_width: 84,
  time: 100,
  loop: true,
  x: 100,
)

coin.play

boom = Sprite.new(
  File.dirname(__FILE__) + "/boom.png",
  clip_width: 127,
  time: 50,
  loop: true,
  x: 200,
)

boom.play do
  puts "Animation Finished!"
end

hero = Sprite.new(
  File.dirname(__FILE__) + "/hero.png",
  width: 78,
  height: 99,
  clip_width: 78,
  time: 250,
  animations: {
    walk: 1..2,
    climb: 3..4,
    cheer: 5..6,
  },
)

on :key_down do |event|
  case event.key
  when "left"
    hero.play animation: :walk, loop: true, flip: :horizontal
  when "right"
    hero.play animation: :walk, loop: true
  when "up"
    hero.play animation: :climb, loop: true
  when "down"
    hero.play animation: :climb, loop: true, flip: :vertical
  when "c"
    hero.play animation: :cheer
  end
end

atlas = Sprite.new(
  File.dirname(__FILE__) + "/atlas.png",
  animations: {
    count: [
      {
        x: 0, y: 0,
        width: 35, height: 41,
        time: 300,
      },
      {
        x: 26, y: 46,
        width: 35, height: 38,
        time: 400,
      },
      {
        x: 65, y: 10,
        width: 32, height: 41,
        time: 500,
      },
      {
        x: 10, y: 99,
        width: 32, height: 38,
        time: 600,
      },
      {
        x: 74, y: 80,
        width: 32, height: 38,
        time: 700,
      },
    ],
  },
  x: 400,
)

atlas.play animation: :count, loop: true

show
