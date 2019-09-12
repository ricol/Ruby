#!/usr/local/bin/ruby

require './html.rb'

h = Html.new 'my html generator'

h.h 1, 'Ricol Wang'
h.p 'This a long paragraph'
h.h 2, 'Wang Xing He - With Content inside' do 
  h.p 'this is enclosed by p'
end

h.p 'this is a long paragraph with content inside' do 
  h.div do 
    h.p 'this is a small paragraph inside div' do
      h.p 'this is another small paragraph inside p'
    end
  end
end

h.p 'welcome'

h.hr
h.h 1, 'table demo'

h.table do 
  h.tr do 
    h.th "name"
    h.th "age"
    h.th "gender"
  end
  h.tr do 
    h.td "ricol"
    h.td '36'
    h.td 'male'
  end
  h.tr do 
    h.td 'wangjing'
    h.td '32'
    h.td 'female'
  end
  h.tr do 
    h.table do 
      h.tr do
        h.th 'new_name'
        h.th 'new_age'
        h.th 'new_gender'
      end
      h.tr do
        for w in %w[ricol 36 male]
          h.td w
        end
      end
    end
  end
end

h.hr

h.a 'welcome', '#'
h.br
h.a 'test', '#' do 
  h.p 'welcome'
end
h.br
h.a 'google', 'http://www.google.com'

h.h 3, 'demo order list'
h.ol do 
  for w in %w[ricol wang xing he]
    h.li w
  end
end

h.h 3, 'demo unordered list'
h.ul do
  for w in %w[wangxinghe ricolwang wangjing qianchunyan huangting]
    h.li w
  end
  h.li 'new list' do 
    h.ol do 
      h.li 'one'
      h.li 'two'
      h.li 'three'
      h.li 'new new list' do
        h.ul do 
          h.li '1'
          h.li '2'
          h.li '3'
        end
      end
    end
  end
end

h.p 'this is text with style', style: "color:red;background-color:blue"

filename = 'temp.html'
content = h.html
puts content
File.open filename, 'w' do |f| f.write content end
# File.open filename, 'w' { |f| f.write h.html } //this won't work
system "open #{filename}"
