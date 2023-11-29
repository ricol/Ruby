#!/usr/bin/env ruby

$CMD_LOCAL = "/usr/local/bin/ruby"
$CMD = "/usr/bin/ruby"

$FROM = [$CMD_LOCAL, $CMD]
$TO = "/usr/bin/env ruby"

$processed, $ignored, $skipped = 0, 0, 0, 0

puts "processing..."

def delete_bang_cmd(all)
  for file in all
    if file.include?("bangcmd.rb")
      $skipped += 1
      next
    end
    content = File.read(file)
    content.strip!
    lines = content.split("\n")
    isprocessed = false

    while lines.count > 0 and (lines[0].include?($CMD) or lines[0].include?($CMD_LOCAL) or lines[0].include?($TO))
      lines.delete_at(0)
      lines.delete_at(0) while lines[0].strip == ""
      $processed += 1
      isprocessed = true
    end
    File.write(file, lines.join("\n") + "\n") if isprocessed
    $ignored += 1 if !isprocessed
  end
end

def add_bang_cmd(all)
  cmd = "#!" + $TO
  for file in all
    content = File.read(file)
    content.strip!
    lines = content.split("\n")
    if lines.include?(cmd)
      #ignore if already added
      $ignored += 1
      next
    else
      #add $TO
      lines.insert(0, cmd)
      lines.insert(1, "") if lines.size > 2 and lines[1].strip != ""
      File.write(file, lines.join("\n") + "\n")
      $processed += 1
    end
  end
end

if ARGV.length <= 1
  puts "Usage: bangcmd.rb --add|--remove <directory>"
  exit
end

cmd = ARGV.first
directory = ARGV.last
all = Dir.glob(directory + "/**/*.rb")
current = Dir.getwd
puts "analysing...#{all.count}"
all = all.map { |f| current + "/" + f }
if cmd == "--add"
  add_bang_cmd(all)
  puts "Total: #{all.size}, processed: #{$processed}, ignored: #{$ignored}, skipped: #{$skipped}"
elsif cmd == "--remove"
  delete_bang_cmd(all)
  puts "Total: #{all.size}, processed: #{$processed}, ignored: #{$ignored}, skipped: #{$skipped}"
else
  puts "Error: unknow parameter!"
end
