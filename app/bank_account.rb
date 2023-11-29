#!/usr/bin/env ruby

require "thread"

class BankAccount
  def init(name, checking, savings)
    @name = name
    @checking = checking
    @savings = savings
    @lock = Mutex.new
  end

  def transfer_from_savings(x)
    @lock.synchronize do
      @savings -= x
      @checking += x
    end
  end

  def report
    @lock.synchronize do
      "-" * 20 + "\n#{@name}\nChecking: #{@checking}\nSavings: #{@savings}\n" + "-" * 20
    end
  end
end

mybank = BankAccount.new
mybank.init("ricol", 10_000, 20_000)
puts mybank.report
puts "Transfering..."
mybank.transfer_from_savings(1000)
puts mybank.report
