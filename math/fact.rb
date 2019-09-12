#!/usr/local/bin/ruby

class Integer
  def fact()
    return 1 if (self.zero?) or (self == 1)
    return self * (self - 1).fact
  end

  def fib()
    return 1 if (self.zero?)
    return 1 if self == 1
    return (self - 1).fib + (self - 2).fib
  end

  @@fib_results = [1, 1]

  def fibonacci()
    @@fib_results[self] ||= (self - 1).fibonacci + (self - 2).fibonacci
  end
end
