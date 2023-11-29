#!/usr/bin/env ruby

class SimpleCLI
  OPTIONS = {
    version: ["-v", "--version"],
    help: ["-h", "--help"],
    reset: ["-r", "--reset"],
  }.freeze
  USAGE = "
  This program understands the following options:
      -v, --version : displays the current version of the program
      -h, --help    : dislays a message with usage instructions
      -r, --reset   : resets the program
  With no command-line options, the program performs its default behavior.
  ".freeze
  VERSION = "Some Project version 0.01 (Pre-Alpha)\n".freeze

  def parse_opts(args)
    return option_by_arg(args[0]) if understand_args?(args)
    display(USAGE)
  end

  private

  def display(content)
    puts content
  end

  def do_default
    puts "I am performing my default behavior"
  end

  def option_by_arg(arg)
    return display(VERSION) if OPTIONS[:version].include?(arg)
    return display(USAGE) if OPTIONS[:help].include?(arg)
    return reset if OPTIONS[:reset].include?(arg)
    do_default
  end

  def reset
    puts "I am resetting myself."
  end

  def understand_args?(args)
    OPTIONS.keys.any? do |key|
      OPTIONS[key].include?(args[0])
    end
  end
end

a = SimpleCLI.new
a.parse_opts(ARGV)
