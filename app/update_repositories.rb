#!/usr/bin/env ruby

puts "Searching git repositories..."
all = Dir.glob("**/.git")
puts "Find #{all.size} repositories."
current = Dir.pwd
processed_dirs = []
ignored_dirs = []
total, processed, ignored, index = all.size, 0, 0, 0

for file in all
  index += 1
  printf "[%2.0f%%] Analysing %s...", index * 100.0 / total, file.gsub("/.git", "")
  if File.directory?(file)
    dir = current + "/" + file.gsub("/.git", "")
    print "Processing..."
    if File.directory?(dir)
      Dir.chdir(dir) do
        begin
          cmd = "" '
if git status --porcelain | grep -q .; then
    git stash
    echo "Changes stashed."
else
    echo "No changes to stash."
fi
          ' ""
          system(cmd)
          system("git fetch --all --prune && git pull --rebase")
        rescue
          print "[Error]\n"
        end
        processed += 1
        processed_dirs << file.gsub("/.git", "")
      end
    else
      print "[Error]\n"
      ignored += 1
      ignored_dirs << file.gsub("/.git", "")
    end
  else
    print "[Error]\n"
    ignored += 1
    ignored_dirs << file.gsub("/.git", "")
  end
end
puts "-" * 40
puts "Completed with result as follow:"
puts "processed: "
puts "#{processed_dirs}"
puts "-" * 40
puts "ignored: "
puts "#{ignored_dirs}"
puts "-" * 40
puts "Total: #{total}, processed: #{processed}, ignored: #{ignored}"
puts "-" * 40
