from wsgiref.simple_server import make_server
from connectiondb import get_connection, close_connection
import mysql.connector
from webob import Response
from jinja2 import Environment, FileSystemLoader
import os
from urllib.parse import unquote, parse_qs  # caracteres especiales
import html

# Configurar Jinja2
template_loader = FileSystemLoader(searchpath=os.path.join(os.path.dirname(__file__), 'templates'))
jinja2_env = Environment(loader=template_loader)

def process_post_request(environ, start_response):
    path_info = environ['PATH_INFO']
    
    if path_info == '/guardar_cliente':
       return guardar_cliente(environ, start_response)
       
def obtener_id_cliente():

    connection = get_connection()
    cursor = connection.cursor()

    try:
        # Obtener el último ID de cliente insertado
        query = "SELECT MAX(idcliente) FROM cliente"
        cursor.execute(query)
        result = cursor.fetchone()

        if result and result[0] is not None:
            last_client_id = result[0] + 1
        else:
            last_client_id = 1  # Si no hay clientes, comenzamos desde el ID 1

        return last_client_id

    except Exception as e:
        print(f"Error al obtener el ID del cliente: {e}")
        raise  # Puedes manejar el error según tus necesidades

    finally:
        close_connection(connection)

def obtener_marcas_equipos():
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT DISTINCT marca FROM tipo_equipo"
    cursor.execute(query)
    marcas = [marca['marca'] for marca in cursor.fetchall()]

    close_connection(connection)

    return marcas

def obtener_modelos_equipos():
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT DISTINCT modelo FROM tipo_equipo"
    cursor.execute(query)
    modelos = [modelo['modelo'] for modelo in cursor.fetchall()]

    close_connection(connection)

    return modelos

def obtener_tipos_equipos():
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT DISTINCT tipo FROM tipo_equipo"
    cursor.execute(query)
    tipos = [tipo['tipo'] for tipo in cursor.fetchall()]

    close_connection(connection)

    return tipos

def guardar_edicion(environ, start_response):
    if environ['REQUEST_METHOD'] == 'POST':
        post_data = parse_qs(environ['wsgi.input'].read().decode('utf-8'))

        # Agrega una validación para verificar si los datos necesarios están presentes en el formulario
        required_fields = ['orden_id', 'nombre_cliente', 'apellido', 'dni', 'contacto', 'tipo_equipo', 'marca', 'modelo',
                            'posible_falla', 'reparaciones_anteriores']
        if not all(field in post_data for field in required_fields):
            response = Response(status='400 Bad Request', body='Faltan datos en el formulario')
            return response(environ, start_response)

        # Obtener los datos del formulario
        orden_id = unquote(post_data['orden_id'][0])
        nombre_cliente = unquote(post_data['nombre_cliente'][0])
        apellido = unquote(post_data['apellido'][0])
        dni = unquote(post_data['dni'][0])
        contacto = unquote(post_data['contacto'][0])
        tipo_equipo = unquote(post_data['tipo_equipo'][0])
        marca = unquote(post_data['marca'][0])
        modelo = unquote(post_data['modelo'][0])
        posible_falla = unquote(post_data['posible_falla'][0])
        reparaciones_anteriores = unquote(post_data['reparaciones_anteriores'][0])

        connection = get_connection()
        cursor = connection.cursor()

        try:
            # Actualizar la tabla de clientes
            query_cliente = """
                UPDATE cliente
                SET nombre = %s,
                    apellido = %s,
                    dni = %s,
                    contacto = %s
                WHERE idcliente = %s
            """
            cursor.execute(query_cliente, (nombre_cliente, apellido, dni, contacto, orden_id))

            # Actualizar la tabla de equipos
            query_equipo = """
                UPDATE equipo
                SET marca = %s,
                    modelo = %s,
                    posible_falla = %s,
                    reparaciones_anteriores = %s
                WHERE idequipo = %s
            """
            cursor.execute(query_equipo, (marca, modelo, posible_falla, reparaciones_anteriores, orden_id))

            connection.commit()
            close_connection(connection)

            # Redirigir a la página de ordenes después de guardar
            start_response('302 Found', [('Location', '/ordenes')])
            return [b'']

        except Exception as e:
            print(f"Error al guardar la edición: {e}")

            connection.rollback()  # Deshacer la transacción en caso de error
            close_connection(connection)

            # Devolver una respuesta de error al cliente
            response = Response(status='500 Internal Server Error', body='Error interno al guardar la edición')
            return response(environ, start_response)

    # Si la solicitud no es POST, simplemente devolver una respuesta vacía
    response = Response(status='200 OK', body='')
    return response(environ, start_response)

def fetch_clientes():
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = "SELECT * FROM cliente"
    cursor.execute(query)
    clientes = cursor.fetchall()

    close_connection(connection)

    return clientes

def fetch_ordenes():
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
        SELECT 
            cliente.idcliente, 
            REPLACE(cliente.nombre, '+', ' ') AS nombre_cliente,
            REPLACE(cliente.apellido, '+', ' ') AS apellido,
            cliente.dni,
            REPLACE(cliente.contacto, '+', ' ') AS contacto,
            equipo.idequipo, 
            tipo_equipo.tipo,
            REPLACE(equipo.marca, '+', ' ') AS marca,
            REPLACE(equipo.modelo, '+', ' ') AS modelo,
            REPLACE(equipo.posible_falla, '+', ' ') AS posible_falla,
            REPLACE(equipo.reparaciones_anteriores, '+', ' ') AS reparaciones_anteriores
        FROM 
            cliente
        JOIN 
            equipo ON cliente.idcliente = equipo.idcliente
        JOIN
            tipo_equipo ON equipo.idtipo_equipo = tipo_equipo.idtipo_equipo
    """
    cursor.execute(query)
    ordenes = cursor.fetchall()

    close_connection(connection)

    return ordenes

def obtener_datos_del_orden_desde_la_base_de_datos(orden_id):
    connection = get_connection()
    cursor = connection.cursor(dictionary=True)

    query = """
        SELECT 
            cliente.idcliente, 
            REPLACE(cliente.nombre, '+', ' ') AS nombre_cliente,
            REPLACE(cliente.apellido, '+', ' ') AS apellido,
            cliente.dni,
            REPLACE(cliente.contacto, '+', ' ') AS contacto,
            equipo.idequipo, 
            tipo_equipo.tipo,
            REPLACE(equipo.marca, '+', ' ') AS marca,
            REPLACE(equipo.modelo, '+', ' ') AS modelo,
            REPLACE(equipo.posible_falla, '+', ' ') AS posible_falla,
            REPLACE(equipo.reparaciones_anteriores, '+', ' ') AS reparaciones_anteriores
        FROM 
            cliente
        JOIN 
            equipo ON cliente.idcliente = equipo.idcliente
        JOIN
            tipo_equipo ON equipo.idtipo_equipo = tipo_equipo.idtipo_equipo
        WHERE 
            cliente.idcliente = %s
    """
    cursor.execute(query, (orden_id,))
    orden = cursor.fetchone()

    close_connection(connection)

    # Reemplazar los signos de suma con espacios en blanco en los datos recuperados
    for key, value in orden.items():
        if isinstance(value, str):
            orden[key] = value.replace('+', ' ')

    return orden

def build_client_table(clientes):
    table_content = '<table class="table">\n'
    table_content += '<thead>\n<tr>\n<th scope="col">Número de Cliente</th>\n<th scope="col">Nombre</th>\n<th scope="col">Apellido</th>\n<th scope="col">DNI</th>\n<th scope="col">Contacto</th>\n</tr>\n</thead>\n<tbody>\n'

    for cliente in clientes:
        table_content += '<tr>\n'
        table_content += f'<td>{cliente["idcliente"]}</td>\n'
        table_content += f'<td>{cliente["nombre"]}</td>\n'
        table_content += f'<td>{cliente["apellido"]}</td>\n'
        table_content += f'<td>{cliente["dni"]}</td>\n'
        table_content += f'<td>{cliente["contacto"]}</td>\n'
        table_content += '</tr>\n'

    table_content += '</tbody>\n</table>\n'
    return table_content

def build_orders_table(ordenes):
    table_content = '<table class="table table-striped">\n<thead>\n<tr>\n'
    table_content += '<th scope="col">Número Cliente</th>\n'
    table_content += '<th scope="col">Nombre</th>\n'
    table_content += '<th scope="col">Apellido</th>\n'
    table_content += '<th scope="col">DNI</th>\n'
    table_content += '<th scope="col">Contacto</th>\n'
    table_content += '<th scope="col">Numero Equipo</th>\n'
    table_content += '<th scope="col">Tipo de Equipo</th>\n'
    table_content += '<th scope="col">Marca</th>\n'
    table_content += '<th scope="col">Modelo</th>\n'
    table_content += '<th scope="col">Posible Falla</th>\n'
    table_content += '<th scope="col">Reparaciones Anteriores</th>\n'
    table_content += '<th scope="col">Acciones</th>\n'  # Nueva columna para acciones
    table_content += '</tr>\n</thead>\n<tbody>\n'

    for orden in ordenes:
        table_content += '<tr>\n'
        table_content += f'<td>{orden["idcliente"]}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["nombre_cliente"]))}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["apellido"]))}</td>\n'
        table_content += f'<td>{orden["dni"]}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["contacto"]))}</td>\n'
        table_content += f'<td>{orden["idequipo"]}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["tipo"]))}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["marca"]))}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["modelo"]))}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["posible_falla"]))}</td>\n'
        table_content += f'<td>{html.unescape(unquote(orden["reparaciones_anteriores"]))}</td>\n'
        table_content += f'<td><a href="/editar/orden/{orden["idcliente"]}">Editar</a></td>\n'  # Enlace de edición
        table_content += '</tr>\n'

    table_content += '</tbody>\n</table>\n'

    return table_content

def guardar_cliente(environ, start_response):
    try:
        if environ['REQUEST_METHOD'] == 'POST':
            post_data = parse_qs(environ['wsgi.input'].read().decode('utf-8'))

            required_fields_cliente = ['nombre', 'apellido', 'dni', 'contacto']
            if not all(field in post_data for field in required_fields_cliente):
                response = Response(status='400 Bad Request', body='Faltan datos en el formulario del cliente')
                return response(environ, start_response)

            nombre_cliente = unquote(post_data['nombre'][0])
            apellido = unquote(post_data['apellido'][0])
            dni = unquote(post_data['dni'][0])
            contacto = unquote(post_data['contacto'][0])

            connection = get_connection()
            cursor = connection.cursor()

            # Insertar datos del cliente
            query_cliente = """
                INSERT INTO cliente (nombre, apellido, dni, contacto)
                VALUES (%s, %s, %s, %s)
            """
            cursor.execute(query_cliente, (nombre_cliente, apellido, dni, contacto))

            # Obtener el ID del cliente recién insertado
            id_cliente = cursor.lastrowid

            print(f"ID Cliente: {id_cliente}")
            print(f"Nombre Cliente: {nombre_cliente}")
            print(f"Apellido: {apellido}")
            print(f"DNI: {dni}")
            print(f"Contacto: {contacto}")

            connection.commit()
            close_connection(connection)

            # Redirigir a la página de formulario de equipo después de guardar el cliente
            start_response('302 Found', [('Location', '/formulario_equipo')])
            return [b'']
    except Exception as e:
        print(f"Error al guardar cliente: {e}")

        connection.rollback()
        close_connection(connection)

        response = Response(status='500 Internal Server Error', body=f'Error interno al guardar el cliente: {str(e)}')
        return response(environ, start_response)

    # Si ocurre algún error, devolver una respuesta de error
    response = Response(status='500 Internal Server Error', body='Error interno al guardar el cliente')
    return response(environ, start_response)

def guardar_equipo(environ, start_response):
    connection = None
    cursor = None

    try:
        if environ['REQUEST_METHOD'] == 'POST':
            post_data = parse_qs(environ['wsgi.input'].read().decode('utf-8'))

            required_fields = ['tipo_equipo', 'marca', 'modelo', 'falla']
            if not all(field in post_data for field in required_fields):
                response = Response(status='400 Bad Request', body='Faltan datos en el formulario del equipo')
                return response(environ, start_response)

            tipo_equipo = unquote(post_data['tipo_equipo'][0])
            marca = unquote(post_data['marca'][0])
            modelo = unquote(post_data['modelo'][0])

            # Verificar si el campo 'reparaciones_anteriores' está presente en el formulario
            reparaciones_anteriores = unquote(post_data.get('reparaciones_anteriores', ''))

            falla = unquote(post_data['falla'][0])

            connection = get_connection()
            cursor = connection.cursor()

            # Asegúrate de tener el valor correcto para id_cliente según tu lógica de aplicación
            id_cliente = obtener_id_cliente()  # Ajusta esto según tu aplicación

            # Insertar datos del equipo
            query_equipo = """
                INSERT INTO equipo (idcliente, tipo_equipo, marca, modelo, reparaciones_anteriores, falla)
                VALUES (%s, %s, %s, %s, %s, %s)
            """
            cursor.execute(query_equipo, (id_cliente, tipo_equipo, marca, modelo, reparaciones_anteriores, falla))

            connection.commit()

            # Redirigir a la página de órdenes después de guardar
            start_response('302 Found', [('Location', '/ordenes')])
            return [b'']

    except Exception as e:
        print(f"Error al guardar equipo: {e}")

    finally:
        # Liberar recursos en el bloque finally
        if cursor:
            cursor.close()
        if connection and connection.is_connected():
            connection.close()

    # Si ocurre algún error, devolver una respuesta de error
    response = Response(status='500 Internal Server Error', body='Error interno al guardar el equipo')
    return response(environ, start_response)

def guardar_edicion_cliente(environ, start_response):
    if environ['REQUEST_METHOD'] == 'POST':
        post_data = parse_qs(environ['wsgi.input'].read().decode('utf-8'))

        # Agrega una validación para verificar si los datos necesarios están presentes en el formulario
        required_fields = ['orden_id', 'nombre_cliente', 'apellido', 'dni', 'contacto']
        if not all(field in post_data for field in required_fields):
            response = Response(status='400 Bad Request', body='Faltan datos en el formulario')
            return response(environ, start_response)

        # Obtener los datos del formulario
        orden_id = unquote(post_data['orden_id'][0])
        nombre_cliente = unquote(post_data['nombre_cliente'][0])
        apellido = unquote(post_data['apellido'][0])
        dni = unquote(post_data['dni'][0])
        contacto = unquote(post_data['contacto'][0])

        connection = get_connection()
        cursor = connection.cursor()

        try:
            # Actualizar la tabla de clientes
            query_cliente = """
                UPDATE cliente
                SET nombre = %s,
                    apellido = %s,
                    dni = %s,
                    contacto = %s
                WHERE idcliente = %s
            """
            cursor.execute(query_cliente, (nombre_cliente, apellido, dni, contacto, orden_id))

            connection.commit()
            close_connection(connection)

            # Redirigir a la página de ordenes después de guardar
            start_response('302 Found', [('Location', '/ordenes')])
            return [b'']

        except Exception as e:
            print(f"Error al guardar la edición: {e}")

            connection.rollback()  # Deshacer la transacción en caso de error
            close_connection(connection)

            # Devolver una respuesta de error al cliente
            response = Response(status='500 Internal Server Error', body='Error interno al guardar la edición')
            return response(environ, start_response)

    # Si la solicitud no es POST, simplemente devolver una respuesta vacía
    response = Response(status='200 OK', body='')
    return response(environ, start_response)

def application(environ, start_response):
    path_info = environ['PATH_INFO']

    if path_info == '/clientes':
        clientes = fetch_clientes()
        template = jinja2_env.get_template('clientes.html')
        response_content = template.render(clientes=clientes)
        status = '200 OK'
        headers = [('Content-type', 'text/html; charset=utf-8')]
        start_response(status, headers)
        return [response_content.encode('utf-8')]

    elif path_info == '/ordenes':
        ordenes = fetch_ordenes()
        template = jinja2_env.get_template('ordenes.html')
        response_content = template.render(ordenes=ordenes)

    elif path_info.startswith('/editar/orden/'):
        if environ['REQUEST_METHOD'] == 'GET':
            orden_id = path_info.split('/')[-1]
            orden = obtener_datos_del_orden_desde_la_base_de_datos(orden_id)
            template = jinja2_env.get_template('editar.html')
            response_content = template.render(
                orden_id=orden_id,
                nombre_cliente=orden['nombre_cliente'],
                apellido=orden['apellido'],
                dni=orden['dni'],
                contacto=orden['contacto'],
                numero_equipo=orden['idequipo'],
                tipo_equipo=orden['tipo'],
                marca=orden['marca'],
                modelo=orden['modelo'],
                posible_falla=orden['posible_falla'],
                reparaciones_anteriores=orden['reparaciones_anteriores']
            )

    elif path_info.startswith('/guardar_edicion/'):
        if environ['REQUEST_METHOD'] == 'POST':
            try:
                # Intenta realizar la edición y obtener la respuesta
                response = guardar_edicion(environ, start_response)
                
                # Si la edición fue exitosa, redirige a la página de órdenes
                if response and response.startswith('3'):
                    start_response('302 Found', [('Location', '/ordenes')])
                    return [b'']
                
                # Si la edición falla, devuelve la respuesta normalmente
                return response
            except Exception as e:
                print(f"Error al procesar la edición: {e}")
                start_response('500 Internal Server Error', [('Content-type', 'text/html; charset=utf-8')])
                return [b'Error interno del servidor']

    elif path_info == '/formulario_ingreso':
        if environ['REQUEST_METHOD'] == 'GET':
            template = jinja2_env.get_template('formulario_ingreso.html')
            tipos_equipos = obtener_tipos_equipos()
            marcas_equipos = obtener_marcas_equipos()
            modelos_equipos = obtener_modelos_equipos()
            response_content = template.render(
                tipos_equipos=tipos_equipos,
                marcas_equipos=marcas_equipos,
                modelos_equipos=modelos_equipos
            )
        elif environ['REQUEST_METHOD'] == 'POST':
            # Obtener datos del formulario
            post_data = parse_qs(environ['wsgi.input'].read().decode('utf-8'))

            required_fields = ['nombre', 'apellido', 'dni', 'contacto', 'id_equipo']
            if not all(field in post_data for field in required_fields):
                response = Response(status='400 Bad Request', body='Faltan datos en el formulario del cliente')
                return response(environ, start_response)

            nombre_cliente = unquote(post_data['nombre'][0])
            apellido = unquote(post_data['apellido'][0])
            dni = unquote(post_data['dni'][0])
            contacto = unquote(post_data['contacto'][0])
            id_equipo = unquote(post_data['id_equipo'][0])

            connection = get_connection()
            cursor = connection.cursor()

            try:
                # Insertar en la tabla de cliente
                query_cliente = """
                    INSERT INTO cliente (nombre, apellido, dni, contacto)
                    VALUES (%s, %s, %s, %s)
                """
                cursor.execute(query_cliente, (nombre_cliente, apellido, dni, contacto))

                id_cliente = cursor.lastrowid

                print(f"ID Cliente: {id_cliente}")
                print(f"Nombre Cliente: {nombre_cliente}")
                print(f"Apellido: {apellido}")
                print(f"DNI: {dni}")
                print(f"Contacto: {contacto}")
                print(f"ID Equipo: {id_equipo}")

                # Vincular cliente con equipo
                query_vinculo = """
                    UPDATE equipo
                    SET idcliente = %s
                    WHERE idequipo = %s
                """
                cursor.execute(query_vinculo, (id_cliente, id_equipo))

                connection.commit()
                close_connection(connection)

                start_response('200 OK', [('Content-type', 'text/plain')])
                return ['Datos del cliente y vinculación al equipo guardados exitosamente']

            except Exception as e:
                print(f"Error al guardar el cliente: {e}")

                connection.rollback()
                close_connection(connection)

                response = Response(status='500 Internal Server Error', body='Error interno al guardar el cliente')
                return response(environ, start_response)
      
    elif path_info.startswith('/editar/cliente/'):
        if environ['REQUEST_METHOD'] == 'GET':
            orden_id = path_info.split('/')[-1]
            orden = obtener_datos_del_orden_desde_la_base_de_datos(orden_id)
            template = jinja2_env.get_template('editar_cliente.html')
            response_content = template.render(
                orden_id=orden_id,
                nombre_cliente=orden['nombre_cliente'],
                apellido=orden['apellido'],
                dni=orden['dni'],
                contacto=orden['contacto'],
            )
            status = '200 OK'
            headers = [('Content-type', 'text/html; charset=utf-8')]
            start_response(status, headers)
            return [response_content.encode('utf-8')]

    elif path_info.startswith('/guardar_edicion_cliente/'):
        if environ['REQUEST_METHOD'] == 'POST':
            try:
                # Intenta realizar la edición y obtener la respuesta
                response = guardar_edicion_cliente (environ, start_response)

                # Si la edición fue exitosa, redirige a la página de órdenes
                if response and response.startswith(b'3'):
                    start_response('302 Found', [('Location', '/clientes')])
                    return [b'']

                # Si la edición falla, devuelve la respuesta normalmente
                return response
            except Exception as e:
                print(f"Error al procesar la edición: {e}")
                status = '500 Internal Server Error'
                headers = [('Content-type', 'text/html; charset=utf-8')]
                start_response(status, headers)
                return [b'Error interno del servidor']
            
    elif path_info == '/index':
        template = jinja2_env.get_template('index.html')
        response_content = template.render()
    
    elif environ['REQUEST_METHOD'] == 'POST':
        return process_post_request(environ, start_response)
    
    else:
        response_content = 'ERROR'
        start_response('302 Found', [('Location', '/ordenes')])
        return [b'']

    status = '200 OK'
    headers = [('Content-type', 'text/html; charset=utf-8')]
    start_response(status, headers)

    return [response_content.encode('utf-8')]


if __name__ == '__main__':
    with make_server('', 8080, application) as httpd:
        print("SERVIDOR ACTIVADO EN PUERTO 8080...")
        httpd.serve_forever()