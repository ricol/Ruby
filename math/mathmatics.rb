#!/usr/bin/env ruby

def f(x)
  return x * x + x * 2 + 3
end

index = 0
-1.step(1, 0.01) do |x|
  index += 1
  f = f(x)
  printf("f(%.2f)=%.2f\t", x, f)
  printf("\n") if index % 1 == 0
end
puts
