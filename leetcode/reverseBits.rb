#!/usr/bin/env ruby

def reverse_bits(n)
    if n.kind_of?(String)
        s = n.reverse.strip
        r = 0
        i = 0
        s.reverse.each_char do |c|
            r += (2 ** i) * c.to_i
            i += 1
        end
        return r
    else 
        b = []
        x = n
        while x > 1
            a = x % 2
            b << a
            x = x >> 1
        end
        b << x
        r = 0
        i = 0
        b.reverse.each do |c|
            r += (2 ** i) * c.to_i
            i += 1
        end
        return r
    end
end

for k, v in {"00000010100101000001111010011100  " => 964176192, "00000010100101000001111010011100" => 964176192}
    r = reverse_bits(k)
    puts "input: #{k}, answer: #{v}, mine: #{r}, -> #{r == v ? 'pass' : 'fail'}"
end