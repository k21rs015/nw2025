#! /usr/local/bin/ruby

#./client1.rb ホスト名　パス名
#ヘッダ情報を表示しないように改良

require "socket"

#host, path = ARGV
url=ARGV[0]
url=url[7..]
index = url.index("/")
host = url[0,index]
path = url[index...]

puts "host:#{host}"
puts "path:#{path}"

puts url

s = TCPSocket.open(host, "http")
s.print("GET #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("Connection: close\r\n")
s.print("\r\n")

while line=s.gets
  break if line == "\r\n"
end

#while line=s.gets&.chomp
# break if line.wmpty?
#end

while line=s.gets&.chomp
  puts line
end