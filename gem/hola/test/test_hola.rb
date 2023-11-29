#!/usr/bin/env ruby

require "minitest/autorun"
require File.dirname(__FILE__) + "/../lib/hola"

class HolaTest < Minitest::Test
  def test_english_hello
    assert_equal "hello world", Hola.hi("english")
  end

  def test_any_hello
    assert_equal "alien language", Hola.hi("chinese")
  end

  def test_spanish_hello
    assert_equal "hola mundo", Hola.hi("spanish")
  end
end
