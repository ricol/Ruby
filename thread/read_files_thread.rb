#!/usr/bin/env ruby

def conread(filenames)
  h = {}

  filenames.each do |filename|
    h[filename] = Thread.new do
      open(filename) do |f|
        f.read
      end
    end
  end

  h.each_pair do |filename, thread|
    begin
      h[filename] = thread.value
    rescue
      h[filename] = $!
    end
  end

  h
end

h = conread ARGV
puts h
