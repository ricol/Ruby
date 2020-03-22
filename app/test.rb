#!/usr/local/bin/ruby

def test
  return yield('ricol')
end

new_name = test() { |x| 
  x * 2
}
puts new_name
