#!/usr/bin/env ruby

if ARGV.count != 1
  puts "Usage: app <directory>"
  exit
end
dir = ARGV.first
$total_files = 0
$total_directory = 0
puts "Processing...#{dir}"

def format(file)
  return if !File.file?(file)
  $total_files += 1
  puts "formatting #{File.basename(file)} ..."
  system("clang-format #{file} -i")
end

def process(dir)
  return if !File.directory?(dir)
  $total_directory += 1
  puts "directory #{File.basename(dir)}"
  Dir.chdir(dir)
  files = Dir.entries(".")
  for file in files
    next if file == "." || file == ".."
    nfile = Dir.pwd + "/" + file
    if File.directory?(nfile)
      process(nfile)
      Dir.chdir("..")
    elsif File.extname(file) == ".m" || File.extname(file) == ".h"
      format(nfile)
    end
  end
end

process(dir)
puts "-" * 20
puts "total files: #{$total_files}"
puts "total directories: #{$total_directory}"
puts "done."
