#!/usr/bin/python
from BaseHTTPServer import BaseHTTPRequestHandler, HTTPServer

PORT_NUMBER = 8080


class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write("Hello World!")
        return


if __name__ == "__main__":
    server = HTTPServer(('', PORT_NUMBER), Handler)
    print 'HTTP server on port ', PORT_NUMBER
    server.serve_forever()
