#! /usr/bin/ruby

require "socket"

s0 = TCPServer.open(80)
loop do
  sock =s0.accept
  Thread.new do
    line = sock.gets&.chomp
    _cmd,path,_ver =line.split
    case path
    when "/93"
      sock.puts "HTTP/1.0 301 Move Permanently"
      sock.puts "Location: http://www.kyusan-u.ac.jp/"
      sock.puts 
    when "/hello"
      sock.puts "HTTP/1.0 200 OK"
      sock.puts 
      sock.puts "Hellow, world!"
    else 
      path="./#{path}"
      if File.exist? path
        sock.puts "HTTP/1.0 200 OK"
        sock.puts "Content-Type: text/plain; charset=UTF-8"
        sock.puts 
        File.open path, "r" do |file|
          while fl = file.gets&.chomp
            sock.puts fl
          end
        end
      else
        sock.puts "HTTP/1.0 404 Not Found"
        sock.puts
      end
      sock.puts path
    end
    sock.close
  end
end
