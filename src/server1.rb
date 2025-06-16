#!/usr/bin/ruby
require "socket"
def server sock
    while buf = sock.gets
        p buf
    end
    sock.close 
end

#ポート番号80番でopen
s0=TCPServer.open(80)
while  true
  sock=s0.accept
  server sock
end
s0.close