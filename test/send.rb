class A
	
end

class A
	def go
		puts "in go..."
	end
end

a = A.new
if a.respond_to?(:go)
	a.send(:go)
end
if a.respond_to?('go')
	a.send('go')
end
if a.respond_to?('go')
	a.go
end
puts a
