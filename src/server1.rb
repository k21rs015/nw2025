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
sock=s0.accept
server sock
s0.close