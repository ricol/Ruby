#!/usr/local/bin/ruby

class FileList

	attr :items

	def initialize
		@items = []
	end

	def to_ary
		@items
	end

end

a = ['wang', 'ricol']
b = FileList.new
b.items << 'xing'
b.items << 'he'
z = a + b
puts z
