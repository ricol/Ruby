#!/usr/bin/env ruby

def search(text, body)
  puts "search for text: #{text}..."
  data = text.chars
  total = body.chars
  i = 0
  pos = 0

  while pos <= total.count - data.count
    puts "pos: #{pos}"
    while i < data.count && i + pos < total.count && data[i] == total[i + pos]
      i += 1
      puts "i: #{i}, #{data[i - 1]}, #{total[i + pos - 1]}"
    end
    return pos if i >= data.count
    i = 0
    pos += 1
  end

  return -1
end

def search_updated(text, body)
  puts "search_updated for text: #{text}..."
  data = text.chars
  total = body.chars
  i = 0
  pos = 0
  while pos <= total.count - data.count
    puts "pos: #{pos}"
    while i < data.count && i + pos < total.count && data[i] == total[i + pos]
      i += 1
      puts "i: #{i}, #{data[i - 1]}, #{total[i + pos - 1]}"
    end
    return pos if i >= data.count
    i = 0
    pos += 1
  end

  return -1
end

text = "wangwangxinghe"
body = "wangwangwangxinghe wagwangxinsdfwxingheansdwangxinghfiwan dsfwangwangxinghewsasdfwangxingsstar"
puts "searching for #{text}...#{search(text, body)}, #{search_updated(text, body)}"
