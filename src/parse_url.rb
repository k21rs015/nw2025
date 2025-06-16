#! /usr/bin/ruby

url=ARGV[0]
url=url[7..]
index = url.index("/")
host = url[0,index]
path = url[index...]

puts "host:#{host}"
puts "path:#{path}"

puts url