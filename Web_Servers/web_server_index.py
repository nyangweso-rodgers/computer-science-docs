# To establish the Transfer Connection Protocol(TCP) connection we will so-called sockets:
import socket
HOST, PORT = '', 8888
listen_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
'''
- we made a socket instance and passed it two parameters.
- The first parameter is AF_INET and the second one is SOCK_STREAM. AF_INET refers to the address family ipv4. 
- The SOCK_STREAM means connection oriented TCP protocol.
'''
listen_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
listen_socket.bind((HOST, PORT))
listen_socket.listen(1)
'''
- Then we set the socket option to SOL_SOCKET to manipulate options at the sockets API level. 
- With this done now we can bind the host and port before start to listen from them.
'''

'''
- The socket must be bound to an address and listening for connections. 
- For that we use the socket.accept() property, 
- The return value is a pair (conn, address) where conn is a new socket object usable to send and receive data on the connection, 
- and address is the address bound to the socket on the other end of the connection.
'''

'''
- To receive the data from the socket we use the socket.recv() method, 
- The return value is a bytes object representing the data received. 
- The maximum amount of data to be received at once is specified by its argument. Decode to utf-8 can help us to avoid problems with the data received.
'''
while True:
    client_connection, client_address = listen_socket.accept()
    request_data = client_connection.recv(1024)
    print(request_data.decode('utf-8'))
    
    http_response = b"""\HTTP/1.1 200 OK

Hello, World, I just created a Web Server...! It's awesome
"""
    client_connection.sendall(http_response)
    client_connection.close()