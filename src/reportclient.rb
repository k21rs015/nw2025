require "socket"

puts "バイト給与計算クライアント"
print "ユーザー名を入力してください："
name = gets.chomp

loop do
  print "\n勤務時間（分）を入力してください（終了は q）："
  input = gets.chomp
  break if input.downcase == "q"
  minutes = input.to_i

  print "販売杯数を入力してください："
  cups = gets.chomp.to_i

  # サーバーへ接続してまとめて送信
  socket = TCPSocket.open("localhost", 20000)
  socket.puts "REPORT|#{name}|#{minutes}|#{cups}"

  # 結果を受信
  response = socket.gets.chomp
  if response =~ /^PAY\|(.+?)\|(\d+)$/
    puts "\n--- 結果 ---"
    puts "ユーザー: #{$1}"
    puts "勤務時間: #{minutes} 分"
    puts "販売杯数: #{cups} 杯"
    puts "給与: #{$2} 円"
  else
    puts "エラー: サーバーから不正な応答を受信しました。"
  end

  # 切断
  socket.puts "GOODBYE|#{name}"
  socket.close
end
