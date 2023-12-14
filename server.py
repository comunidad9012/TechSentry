from wsgiref.simple_server import make_server
from script import application


if __name__ == '__main__':
    with make_server('', 8080, application) as httpd:
        print("SERVIDOR ACTIVADO EN PUERTO 8080...")
        httpd.serve_forever()