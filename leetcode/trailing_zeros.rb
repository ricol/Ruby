# @param {Integer} n
# @return {Integer}
def trailing_zeroes(n)
    def factorial(n)
        f = 1
        n.downto(1) do |x|
            f *= x
        end
        return f
    end

    f = factorial(n)

    count = 1
    r = f % 10 ** count
    while r == 0
        count += 1
        r = f % 10 ** count
    end
    
    return count - 1
end

for k, v in {3 => 0, 5 => 1, 0 => 0, 7 => 1}
    r = trailing_zeroes(k)
    puts "input: #{k}, answer: #{v}, mine: #{r} -> #{r == v ? 'pass' : 'fail'}"
end