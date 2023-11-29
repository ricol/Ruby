#!/usr/bin/env ruby

a = [1, 2, 3, 4]
for i in 0...a.count
  puts a[i]
end
b = [a, a, a, a]
for i in 0...b.count
  for j in 0...a.count
    print "#{b[i][j]}\t"
  end
  puts
end
for i in 0...b.count
  for j in 0...a.count
    print "#{b[i, j]}\t"
  end
  puts
end

def show(data)
  puts "show array...#{data.count}"
  if data.instance_of?(Array)
    if data.first.instance_of?(Array)
      for i in 0...data.count
        for j in 0...data[i].count
          print "#{data[i][j]}\t"
        end
        puts
      end
    else
      for i in 0...data.count
        print "#{data[i]}\t"
      end
      puts
    end
  end
end

data = Array.new(10, "a")
show data
data = Array.new(10) { "b" }
show data
data = Array.new(10) { Array.new(10, "c") }
show data

#data may use the same array object as the child array, so this is not correct way to initialize multidimentional array
data = Array.new(10, Array.new(3, 0)) 
show data
#correct way
data = Array.new(10) { Array.new(3, 0) }
show data
