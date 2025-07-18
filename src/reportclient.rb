require 'socket'

socket = TCPSocket.open('localhost', 2000)
username = "iwamoto"

# ログイン
socket.puts "LOGIN|#{username}"
puts socket.gets  # WELCOME

# 労働時間と販売杯数を送信
worked_hours = 2.5     # 2時間30分
cups_sold = 75         # 75杯販売
socket.puts "WORK|#{username}|#{worked_hours}|#{cups_sold}"

# サーバーからの給料情報受け取り
puts socket.gets  # PAY|iwamoto|合計金額

# ログアウト
socket.puts "LOGOUT|#{username}"
puts socket.gets

socket.close
