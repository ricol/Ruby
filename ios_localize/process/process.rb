#!/usr/local/bin/ruby

#this program is used to add new keys
old_file = "old.txt"
new_file = "new.txt"
output_file = "result.txt"

def get_mapping(file)
	mapping = {}
	File.open(file).read.each_line do |line|
		sections = line.split('=')
		k = sections.first.strip
		sections.delete_at(0)
		v = sections.join('=').strip
		mapping[k] = v
	end
	return mapping
end

puts "generating mapping from file #{old_file}..."
old_mapping = get_mapping(old_file)
puts "reading new file #{new_file}..."
new_keys = File.read(new_file).split("\n")

puts "processing..."
new_mapping = old_mapping.dup
new_keys.each do |k|
	new_key = k.strip
	new_mapping["\"#{new_key}\""] = old_mapping[new_key] || ""
end
puts "saving to #{output_file}..."
content = ""
new_mapping.keys.sort!.each do |k|
	content += "#{k} = #{new_mapping[k]}\n"
end
File.write(output_file, content)
puts "complete."
