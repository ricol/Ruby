#!/usr/bin/env ruby

require 'find'

if ARGV.length < 1
	puts "Usage: cleanupgit.rb <directory> <size=100_000_000>"
	exit
end

oversize = 50 * 1024 * 1024
directory = ARGV.first

def directory_size(path)
	total = 0
	Find.find(path) do |f|
		total += File.size(f) if File.file?(f)
	end
	total
end

def format_bytes(size_in_bytes)
	units = %w(B KB MB GB)
	i = 0
	while size_in_bytes >= 1024 && i < units.length - 1
		size_in_bytes /= 1024.0
		i += 1
	end
	format('%.2f %s', size_in_bytes, units[i])
end

oversize = ARGV.last.to_i if ARGV.count >= 2
puts "searching..."
all = Dir.glob(directory + "/**/.git")
gitdirectories = []
sorted = []
all.each do |f|
	sorted << [f, directory_size(f)] if File.directory?(f)
end
sorted.sort_by! { |x| x.last }
puts "sorted result..."
sorted.each do |f|
	puts "#{f.first} [#{format_bytes(f.last)}] #{f.last >= oversize ? "*" : ""}"
end
sorted.each do |f|
	gitdirectories << f if f.last >= oversize
end
puts "oversized: #{gitdirectories.count}"
gitdirectories.each do |r|
	puts "#{r.first} [#{format_bytes(r.last)}]"
end

