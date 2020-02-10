#!/usr/local/bin/ruby

def sort(arr)
  # base case
  n = arr.length
  return arr if n <= 1
  # partition step
  left = sort(arr[0...n / 2])
  right = sort(arr[n / 2...n])
  # merge step
  sorted = []
  while !left.empty? || !right.empty?
    if right.empty? || (!left[0].nil? && left[0] < right[0])
      sorted.push left.shift
    else
      sorted.push right.shift
    end
  end
  sorted
end

def selectionSort(arr)
  arr.each_with_index do |value, index|
    rest = arr[index...arr.size]
    min = rest.min
    minIndex = rest.index(min) + index
    unless minIndex.nil?
      arr[index] = min
      arr[minIndex] = value
    end
  end
end

def merge(left, right)
  result = []
  while !left.empty? && !right.empty?
    a = left.first
    b = right.first
    result.push(a < b ? left.shift : right.shift)
  end
  result + left + right
end

def mergeSort(arr)
  return arr if arr.size <= 1
  middleIndex = arr.size / 2
  left = arr[0...middleIndex]
  right = arr[middleIndex...arr.size]
  merge(mergeSort(left), mergeSort(right))
end

$level = 0
def quickSort(arr)
  return arr if arr.size <= 1
  $level += 1
  pivot = arr.delete_at(arr.size / 2)
  less = []
  greater = []
  arr.each do |n|
    less << n if n <= pivot
    greater << n if n > pivot
  end
  quickSort(less) + [pivot] + quickSort(greater)
end

def bubbleSort(arr)
  begin
    swapCount = 0
    for i in 0...(arr.size - 1)
      a = arr[i]
      b = arr[i + 1]
      next unless a > b
      arr[i] = b
      arr[i + 1] = a
      swapCount += 1
    end
  end while swapCount > 0
  arr
end

NUM = 50000
$data = []

def reset
  $data = []
  NUM.times do |n|
    $data << rand(NUM)
  end
end

def check(data)
  (0..data.count - 2).each do |i|
    return false if data[i] > data[i + 1]
  end
  true
end

reset
puts "sorting..."
STDOUT::flush()
result = sort($data)
puts check(result) ? "ok" : "error"
puts "done."
STDOUT::flush()

reset
puts "selectionSort sorting..."
STDOUT::flush()
result = selectionSort($data)
puts check(result) ? "ok" : "error"
puts "done."
STDOUT::flush()
reset
puts "mergeSort sorting..."
STDOUT::flush()
result = mergeSort($data)
puts check(result) ? "ok" : "error"
puts "done."
STDOUT::flush()
reset
puts "quick sorting..."
STDOUT::flush()
result = quickSort($data)
puts check(result) ? "ok" : "error"
puts "done."
