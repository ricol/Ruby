#!/usr/bin/env ruby

def processfiles(aDir)
  totalbytes = 0
  totalfiles = 0

  Dir.foreach(aDir) do |f|
    mypath = "#{aDir}/#{f}"
    if File.directory?(mypath)
      if f != "." and f != ".."
        processfiles(mypath) do |filesize, totalfile|
          totalbytes += filesize
          totalfiles += totalfile
        end
      end
    else
      filesize = File.size?(mypath)
      filesize = 0 if !filesize
      totalbytes += filesize
      totalfiles += 1
    end
  end

  if block_given?
    yield totalbytes, totalfiles
  end

  return totalbytes
end

if ARGV.length < 1
  puts "Usage: app <dir|file>"
  exit
end

processfiles(ARGV[0]) do |size, totalfiles|
  puts "Dir: #{ARGV[0]}"
  puts "size: #{size} BYTES; #{size / 1024.0} KB; #{size / (1024.0 * 2)} MB; #{size / (1024.0 * 3)} GB"
  puts "files: #{totalfiles}"
end
