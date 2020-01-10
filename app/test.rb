#!/usr/local/bin/ruby

def run_proc(p)
	p.call
end

name = 'ricol'
p = lambda { puts name }
name = 'wang'
run_proc(p)
