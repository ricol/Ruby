#!/usr/bin/env ruby

require "tk"

root = TkRoot.new { title "Hello world." }
TkLabel.new(root) {
  text "hello world"
  pack { padx 15; pady 15; side "left" }
}

Tk.mainloop
