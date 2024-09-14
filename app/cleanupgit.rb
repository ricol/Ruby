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
puts "analyzing..."
gitdirectories = []
all.each do |f|
	if File.directory?(f)
		size = directory_size(f)
		puts "#{f} [#{format_bytes(size)}]" if size >= oversize
	end
end
