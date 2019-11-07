#!/usr/local/bin/ruby

#this program is used to generate missing keys in other locale files from english locale file
from_file = 'result.txt'
output_files_mapping = {"zh-cn.txt" => 'zh-cn-output.txt', "zh-tw.txt" => 'zh-tw-output.txt'}

def get_mapping(file)
	mapping = {}
	File.open(file).read.each_line do |line|
		begin
			sections = line.strip.split("=")
			k = sections.first.strip
			sections.delete_at(0)
			v = sections.join('=')
			mapping[k] = v.strip
		rescue
			puts "error for parsing line: #{line.strip}"
		end
	end
	return mapping
end

def get_str_from_mapping(mapping)
	str = ""
	mapping.keys.sort!.each do |k|
		value = mapping[k]
		str += "#{k} = #{value}\n"
	end
	return str
end

puts "analysing..."
puts "reading english mapping from #{from_file}..."
english_mapping = get_mapping(from_file)
output_files_mapping.each do |file, output|
	puts "reading from #{file}..."
	file_mapping = get_mapping(file)
	puts "process..."
	new_mapping = {}
	english_mapping.each do |k, v|
		new_mapping[k] = file_mapping[k] || "\"\";"
	end
	puts "saving to #{output}..."
	File.write(output, get_str_from_mapping(new_mapping))
end
puts "complete."
