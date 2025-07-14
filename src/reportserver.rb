#!/usr/bin/ruby
require 'socket'

HOURLY_WAGE = 1000 #時給

server = TCPServer.open(2000)
puts "サーバー起動中..."

#歩合を計算する関数
def commisiion(cups_sold)
  case cups_sold
  when 0..40
    0
  when 41..100
    (cups_sold -40) * 40
  else
    (60 * 40) + (cups_sold) * 70
  end
end

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
