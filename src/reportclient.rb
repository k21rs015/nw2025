#! /usr/local/bin/ruby

require 'socket'

socket = TCPSocket.open('localhost', 2000)
socket.puts "LOGIN|iwamoto"

while line = socket.gets
  puts "サーバーから: #{line}"
  break if line.start_with?("GOODBYE")

  # 適当にメッセージを送ってみる
  socket.puts "MSG|iwamoto|こんにちは！"
  sleep 1
  socket.puts "LOGOUT|iwamoto"
end

socket.close