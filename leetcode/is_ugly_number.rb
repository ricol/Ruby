#!/usr/bin/env ruby

# @param {Integer} n
# @return {Boolean}
$primes = { 2 => true, 3 => true, 5 => true }

def is_ugly(n)
  def is_prime(n)
    return false if n < 2
    m = n / 2
    (2..m).each do |x|
      return false if n % x == 0
    end
    return true
  end

  return false if n <= 0
  num = n
  m = num / 2
  (3..m).step(2) do |x|
    if num % x == 0
      s = x / 2
      isPrime = true
      isPrime = is_prime(x) if $primes[x].nil?
      if isPrime
        $primes[x] = false if $primes[x].nil?
        return false if !$primes[x]
      end
    end
  end
  return false if is_prime(n) and n != 2 and n != 3 and n != 5
  return true
end

for k, v in { 2 => true, 6 => true, 1 => true, 14 => false, 8 => true, 47483648 => false, 7 => false, 937351770 => false }
  r = is_ugly(k)
  puts "input: #{k}, result: #{v}, my result: #{r}, -> #{r == v ? "pass" : "fail"}"
end
