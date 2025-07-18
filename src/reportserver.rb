require 'socket'

HOURLY_WAGE = 1000  # 時給（円）

def calculate_commission(cups_sold)
  case cups_sold
  when 0..40
    0
  when 41..100
    (cups_sold - 40) * 40
  else
    (60 * 40) + (cups_sold - 100) * 80
  end
end

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

      when "WORK"
        hours = parts[2].to_f           # 労働時間（小数）
        cups_sold = parts[3].to_i       # 売上杯数

        wage = (hours * HOURLY_WAGE).to_i
        commission = calculate_commission(cups_sold)
        total_pay = wage + commission

        puts "#{username}：#{hours}時間、#{cups_sold}杯 → 基本給#{wage}円＋歩合#{commission}円＝#{total_pay}円"
        conn.puts "PAY|#{username}|#{total_pay}"

      when "LOGOUT"
        puts "#{username} がログアウトしました。"
        conn.puts "GOODBYE|#{username}"
        conn.close
        break

      else
        conn.puts "ERROR|不明なコマンド: #{command}"
      end
    end
  end
end
