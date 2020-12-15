#!/usr/bin/env ruby

require "drb"
DRb.start_service
obj = DRbObject.new(nil, "druby://localhost:9000")
# Now use obj
p obj.doit
