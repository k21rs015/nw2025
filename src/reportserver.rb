#!/usr/bin/ruby
require 'socket'

server = TCPServer.open(2000)
puts "サーバー起動中..."

loop do
  client = server.accept
  Thread.new(client) do |conn|
    while message = conn.gets
      message.chomp!
      parts = message.split("|")
      command = parts[0]
      username = parts[1]

      case command
      when "LOGIN"
        puts "#{username} がログインしました。"
        conn.puts "WELCOME|#{username}"
      when "MSG"
        text = parts[2]
        puts "#{username} says: #{text}"
      when "LOGOUT"
        puts "#{username} がログアウトしました。"
        conn.puts "GOODBYE|#{username}"
        conn.close
        break
      else
        conn.puts "ERROR|未知のコマンド"
      end
    end
  end
end
