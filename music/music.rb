#!/usr/bin/env ruby

require "dl/import"

class LiveMIDI
  ON = 0x90
  OFF = 0x80
  PC = 0xC0

  def initialize
    open
  end

  def note_on(channel, note, velocity = 64)
    message(ON | channel, note, velocity)
  end

  def note_off(channel, note, velocity = 64)
    message(OFF | channel, note, velocity)
  end

  def program_change(channel, preset)
    message(PC | channel, preset)
  end
end

if RUBY_PLATFORM.include?("mswin")
  puts "mswin"

  class LiveMIDI
    extend DL::Importable
    dlload "winmm"

    extern "int midiOutOpen(HMIDIOUT *, int, int, int, int)"
    extern "int midiOutClose(int)"
    extern "int midiOutShortMsg(int, int)"

    def open
      @device = DL.malloc(DL.sizeof("I"))
      C.midiOutOpen(@device, -1, 0, 0, 0)
    end

    def close
      C.midiOutClose(@device.ptr.to_i)
    end

    def message(one, two = 0, three = 0)
      message = one + (two << 8) + (three << 16)
      C.midiOutShortMsg(@device.ptr.to_i, message)
    end
  end
elsif RUBY_PLATFORM.include?("darwin")
  puts "darwin"
elsif RUBY_PLATFORM.include?("linux")
  puts "linux"
else
  puts "not detected."
end
