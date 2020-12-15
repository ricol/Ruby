#!/usr/bin/env ruby

f = File.open(ARGV.first)
puts f.pos
puts f.tell
f.pos = 10
puts f.pos
f.rewind
puts f.pos
f.seek(10, IO::SEEK_SET)
puts f.pos
f.seek(10, IO::SEEK_CUR)
puts f.pos
f.seek(-10, IO::SEEK_END)
puts f.pos
puts f.eof?
f.seek(0, IO::SEEK_END)
puts f.pos
puts f.eof?
