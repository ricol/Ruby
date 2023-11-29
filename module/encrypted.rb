#!/usr/bin/env ruby

require "digest"

module Encryption
  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end
end

class Person
  include Encryption

  attr_accessor :password

  def encrytped_password
    encrypt(@password)
  end

  def initialize(name)
    @name = name
  end
end

person = Person.new("Ada")
person.password = "super secret"
puts person.encrytped_password
