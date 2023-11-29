#!/usr/bin/env ruby

def lines(file)
  f = File.open(file)
  count = f.readlines.count
  f.close
  return count
end

$files = []

def processfiles(aDir, match, pattern)
  totalbytes = 0
  totalfiles = 0
  totallines = 0

  Dir.foreach(aDir) do |f|
    mypath = "#{aDir}/#{f}"
    if File.directory?(mypath)
      if f != "." and f != ".."
        processfiles(mypath, match, pattern) do |filesize, filelines, totalfile|
          totalbytes += filesize
          totallines += filelines
          totalfiles += totalfile
        end
      end
    elsif match == "--type" && pattern != nil
      filename = File.basename(mypath)
      if filename.match("\.#{pattern}$")
        filesize = File.size?(mypath)
        filelines = lines(mypath)
        filesize = 0 if !filesize
        totallines += filelines
        totalbytes += filesize
        totalfiles += 1
        $files << mypath
      end
    else
      filesize = File.size?(mypath)
      filelines = lines(mypath)
      filesize = 0 if !filesize
      totallines += filelines
      totalbytes += filesize
      totalfiles += 1
    end
  end

  yield totalbytes, totallines, totalfiles if block_given?

  return totalbytes
end

if ARGV.length < 2
  puts "Usage: app <dir> --type <pattern> --output <filename>"
  exit
end

root = ARGV[0]
match = ARGV[1]
pattern = ARGV[2]
output = ARGV[3]
filename = ARGV[4]

processfiles(root, match, pattern) do |size, lines, totalfiles|
  puts "Dir: #{root}"
  puts "size: #{size} BYTES; #{size / 1024.0} KB; #{size / (1024.0 * 2)} MB; #{size / (1024.0 * 3)} GB"
  puts "lines: #{lines}"
  puts "files: #{totalfiles}"
end

if output == "--output"
  filename = filename.nil? ? "results.txt" : filename
  f = File.new(filename, "w")
  f.write($files.join("\n"))
  f.close
end
