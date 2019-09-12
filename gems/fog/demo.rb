#!/usr/local/bin/ruby

require 'fog'

connection = Fog::Storage.new({
:provider => "Local",
:local_root => "~/fog"
})

directory = connection.directories.create(:key =>"fog-demo-#{Time.now.to_i}",
:public => true)

p connection.directories.all

file = directory.files.create(:key => 'temp.txt',
:body => 'welcome',
:public => true)

file.save
