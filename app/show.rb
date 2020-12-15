#!/usr/bin/env ruby

def get_lines(filename)
  File.open(filename, "r").readlines
end

def get_format(lines)
  "%0#{lines.size.to_s.size}d"
end

def get_output(lines)
  format = get_format(lines)
  output = ""
  lines.each_with_index do |line, i|
    output += "#{format(format, i + 1)}: #{line}"
  end
  output
end

print get_output(get_lines(ARGV[0]))
