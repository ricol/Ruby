#!/usr/bin/env ruby

def my_atoi(s)
  result = 0
  negative = 0
  started = false
  mapping = "0123456789".chars
  for i in 0...s.length
    if s[i] == " "
      started ? break : next
    elsif s[i] == "-"
      (started or negative == 1) ? break : negative = 1
    elsif s[i] == "+"
      (started or negative == 1) ? break : begin started = true; next end
    elsif mapping.include?(s[i])
      started = true
      result *= 10
      result += s[i].to_i
    else
      break
    end
  end

  result = result * (-1) ** negative
  result > 2147483647 ? 2147483647 : (result < -2147483648) ? -2147483648 : result
end

for (i, v) in { "42" => 42, "-042" => -42, "1337c0d3" => 1337, "0-1" => 0, "words and 987" => 0, "   -042" => -42, "-91283472332" => -2147483648, "+1" => 1,
                "-+12" => 0, "+-12" => 0, "21474836460" => 2147483647, "     +004500" => 4500,
                "    -88827   5655  U" => -88827, "-5-" => -5 }
  r = my_atoi(i)
  puts "input: #{i}, expect: #{v}, actual: #{r} -> #{v == r ? "pass" : "fail"}"
end
