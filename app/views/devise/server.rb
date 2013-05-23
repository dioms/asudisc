require 'socket'

connections = 0

server = TCPServer.open(2000)
loop {
  client = server.accept
  connections += 1
  client.puts("\n\n")
  client.puts("=+" *25)
  client.puts("\n#{connections} clients have connected\n")
  client.puts(Time.now.ctime)
  client.puts("=+" *25)
  client.puts("\n\n")
  client.close
}
