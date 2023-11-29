#!/usr/bin/env ruby

$extensions = [".h", ".m", ".mm"]
$total = 0
$processed = 0
$ignored = 0

def enumerate(path, &block)
  puts "#{path}..."
  Dir.foreach(path) do |f|
    next if f == "." or f == ".."
    absolute = path + "/" + f
    if File.directory?(absolute)
      enumerate(absolute, &block)
    else
      $total += 1
      if $extensions.include?(File.extname(f))
        $processed += 1
        yield absolute if block_given?
      else
        $ignored += 1
      end
    end
  end
end

if ARGV.length < 1
  puts "Usage: format_objc.rb <dir>"
  exit
end

enumerate(File.absolute_path(ARGV.first)) { |f| system("clang-format -i #{f}") }
puts "proccessed: #{$processed}, ignored: #{$ignored}, total: #{$total}"
puts "percentage: #{($processed * 100.0 / $total).to_i}%"
puts "complete."
