import socket
import subprocess
from threading import *
from docker import Client

sock = socket.socket(socket.AF_INET,
                  socket.SOCK_STREAM)

host = socket.gethostname()
port = 9876
sock.bind((host, port))
sock.listen(5)

def runCatmania():
   cli = Client(base_url='unix://var/run/docker.sock')
   cli.restart('catmania')
   inspect = cli.inspect_container("catmania")
   status = inspect['State']['Status']
   return status

def logsCatmania():
   cli = Client(base_url='unix://var/run/docker.sock')
   log = cli.logs('catmania', stdout=True)
   return log

class client(Thread):
    def __init__(self, socket, address):
        Thread.__init__(self)
        self.sock = socket
        self.addr = address
        self.start()

    def run(self):
        while 1:
            msg = self.sock.recv(1024)
            if not msg:
                break
            elif msg == 'java':
                status = runCatmania()
                self.sock.send(status)
                self.sock.close()
            elif msg == 'java_log':
                status = runCatmania()
                status.join('\n')
                self.sock.send(status)
                log = logsCatmania()
                for i in range(0, len(log)):
                     self.sock.send(log[i].rstrip('\n'))
                self.sock.close()   
            else:
                self.sock.close()
while 1:
    clientSocket, address = sock.accept()
    client(clientSocket, address)
