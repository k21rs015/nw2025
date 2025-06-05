#! /usr/local/bin/ruby

#./client1.rb ホスト名　パス名
#
require "socket"

#host = ARGV[0]
#path = ARGV[1]
host, path = ARGV

s = TCPSocket.open(host, "http")
s.print("GET #{path} HTTP/1.1\r\n")
s.print("Host: #{host}\r\n")
s.print("\r\n")

while line=s.gets&.chomp
  puts line
end