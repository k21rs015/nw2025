require "socket"

server = TCPServer.open(20000)
puts "サーバー起動中..."

loop do
  client = server.accept
  puts "クライアント接続: #{client.peeraddr[2]}"

  while line = client.gets
    line.chomp!
    puts "受信: #{line}"

    if line =~ /^REPORT\|(.+?)\|(\d+)\|(\d+)$/
      name = $1
      minutes = $2.to_i
      cups = $3.to_i

      # 時間給計算（1000円/時）
      hourly_pay = (minutes / 60.0) * 1000

      # 歩合計算
      commission = 0
      if cups >= 101
        commission = (cups - 100) * 70 + 60 * 40
      elsif cups >= 41
        commission = (cups - 40) * 40
      end

      total = hourly_pay + commission
      client.puts "PAY|#{name}|#{total.to_i}"
      puts "送信: PAY|#{name}|#{total.to_i}"
    elsif line =~ /^GOODBYE\|(.+)$/
      client.puts "BYE|#{$1}"
      client.close
      break
    else
      client.puts "ERROR|InvalidCommand"
    end
  end
end
