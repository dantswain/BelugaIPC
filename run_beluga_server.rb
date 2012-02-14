require 'lib/beluga_ipc'

server = BelugaIPC::Server.new(1234, '127.0.0.1')

server.audit = true
server.start

server.join

puts "Server has been terminated"
