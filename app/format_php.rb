#!/usr/bin/env ruby

if ARGV.size <= 0
  puts "Usage: format_php.rb <--format | --clean>"
  exit
end

def format()
  puts "Searching php..."
  all = Dir.glob("**/*.php")
  puts "Find #{all.size} php files."
  index, total = 1, all.size

  for file in all
    index += 1
    printf "[%2.0f%%] Formatting %s...", index * 100.0 / total, file
    system("phptidy.php replace #{file}")
  end

  puts "-" * 40
  puts "Total: #{total}"
  puts "-" * 40

  clean()
end

def clean()
  puts "Cleaning..."
  all_baks = Dir.glob("**/.*.php.phptidybak*")

  for file in all_baks
    File.delete(file)
  end

  puts "#{all_baks.size} .phptidybak~ files deleted." if all_baks.size > 0
  all_cache = Dir.glob("**/.phptidy-cache")

  for file in all_cache
    File.delete(file)
  end

  puts "#{all_cache.size} .phptidy-cache files deleted." if all_cache.size > 0
  print "Done.\n"
end

option = ARGV.first

if option == "--format"
  format()
elsif option == "--clean"
  clean()
else
  puts "Unknown command!"
  puts "Commands: --format | --clean"
end
