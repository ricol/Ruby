#!/usr/bin/env ruby

def gcd(m, n)
  a = []
  b = []

  (2..m).each do |t|
    a << t if m % t == 0
  end

  (2..n).each do |t|
    b << t if n % t == 0
  end

  a.reverse.each do |t|
    return t if b.include?(t)
  end

  return 1
end

def gcd_new(m, n)
  max, min = m, n
  if m > n
    max = m
    min = n
  else
    max = n
    min = m
  end

  result = min
  d = max / min
  r = max % min

  while r != 0
    max = min
    min = r
    result = r
    d = max / min
    r = max % min
  end

  return result
end

MAX = 10000
COUNT = 1000
ok = 0
error = 0
COUNT.times do
  a = (rand() * MAX).to_i
  b = (rand() * MAX).to_i
  while a == 0 or b == 0
    a = (rand() * MAX).to_i
    b = (rand() * MAX).to_i
  end
  r1 = gcd(a, b)
  r2 = gcd_new(a, b)
  if r1 == r2
    ok += 1
  else
    error += 1
  end
  puts("gcd(#{a}, #{b}): #{r1}, #{r2} -> #{r1 == r2 ? "ok" : "error"}")
end
puts("result: ok: #{ok}, error: #{error}")
