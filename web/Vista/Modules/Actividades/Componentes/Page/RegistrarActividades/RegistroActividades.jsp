<%-- 
    Document   : RegistroActividades
    Created on : 18 jun. 2023, 23:44:01
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;1,400&display=swap"
            rel="stylesheet"
        />
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"
        />
       <link rel="stylesheet" 
            href="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/ListadoDatosClientes/MostrarClientes.css" 
        />
    </head>
    <body>
        <br>
        <br>
        <br>
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-shopping-cart"></i>
        </div>
        <p>ACTIVIDADES</p>
      </div>
      <div class="grupo-boton-nuevo">
        <button onclick="window.location.href='ControladorCompraRegistro?menu=CompraRegistro&accion=Formulario'">
            <i class="uil uil-plus"></i>
            Nuevo
        </button>
      </div>
    </article>
    <article class="opciones-listado">
      <div class="grupo-boton-nuevo">
        <button onclick="window.location.href='ControladorCompras?menu=Compras&accion=Listar'">
            <i class="uil uil-list-ul"></i>
            Listar Todo
        </button>
      </div>
      <form action="ControladorEmpresas?menu=Empresas" method="POST">  
        <div class="grupo-buscar">
          <input type="search" placeholder="Ingresar la Razón Social a Buscar" name="txtBuscar"/>
          <button type="submit" name="accion" value="Buscar"><i class="uil uil-search"></i>Buscar</button>
        </div>
       </form>
    </article>

    <article class="bg-container-body">
      <div class="container-body">
        <table class="table table-striped table-inverse table-responsive">
          <thead class="thead-inverse">
            <tr>
              <th>Empresa</th> 
              <th>Actividad</th>
              <th>Auto</th>
              <th>Cantidad</th>
              <th>Precio</th>
              <th>Subtotal</th>
            </tr>
          </thead>
          <tbody>
          </tbody>
        </table>
      </div>
    </article>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/ListadoDatosClientes/MostrarClientes.js" 
                type="text/javascript">
        </script>
        <%-- Verificar si existe el mensaje --%>
        <% if (request.getAttribute("mensaje") != null) { %>
          <%-- Obtener el mensaje de la solicitud --%>
          <% String mensaje = (String) request.getAttribute("mensaje"); %>

          <%-- Mostrar el mensaje utilizando SweetAlert --%>
          <script>
            Swal.fire({
              icon: 'warning',
              title: 'Mensaje',
              text: '<%= mensaje %>',
              confirmButtonText: 'Aceptar'
            }).then((result) => {
              if (result.isConfirmed) {
                // Redirigir a la URL después de hacer clic en "Aceptar"
                window.location.href = 'ControladorEmpresas?menu=Empresas&accion=Listar';
              }
            });
          </script>
        <% } %>
        
    </body>
</html>

