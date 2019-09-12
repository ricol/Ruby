#!/usr/local/bin/ruby

CMD_LOCAL = "#!/usr/local/bin/ruby"
CMD = "#!/usr/bin/ruby"

$all = Dir.glob('**/*.rb')
$processed, $ignored = 0, 0, 0

puts "processing..."

def delete_bang_cmd(all)
  for file in all
  	next if file.include?("bangcmd.rb")
    content = File.read(file)
    content.strip!
    lines = content.split("\n")
		while lines.count > 0 and (lines[0].include?("/usr/bin/ruby") or lines[0].include?("/usr/local/bin/ruby"))
			lines.delete_at(0)
			$processed += 1
		end
		File.write(file, lines.join("\n") + "\n") if $processed
		$ignored += 1 if !$processed
  end
end

def add_bang_cmd(all)
  for file in all
    content = File.read(file)
    content.strip!
    lines = content.split("\n")
    if lines.include?(CMD_LOCAL)
      $ignored += 1
      next
    else
      lines.delete(CMD)
      lines.insert(0, CMD_LOCAL)
      if lines.size > 2
        if lines[1].strip != ""
          lines.insert(1, "")
        end
      end
      File.write(file, lines.join("\n") + "\n")
      $processed += 1
    end
  end
end

if ARGV.length <= 0
  puts "Usage: bangcmd.rb --add|--remove"
  exit
end

cmd = ARGV.last
if cmd == "--add"
  add_bang_cmd($all)
  puts "Total: #{$all.size}, processed: #{$processed}, ignored: #{$ignored}"
elsif cmd == "--remove"
  delete_bang_cmd($all)
  puts "Total: #{$all.size}, processed: #{$processed}, ignored: #{$ignored}"
else
  puts "Error: unknow parameter!"
end
