<%-- 
    Document   : Usuarios
    Created on : 18 jun. 2023, 23:07:40
    Author     : CLAUDIO CRUZADO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            href="Vista/Modules/Configuracion/ConfiguracionBasica/Usuarios/Componentes/Page/MostrarUsuarios/MostrarUsuarios.css" 
        />
    </head>
    <body>
        <br>
        <br>
        <br>
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-building"></i>
        </div>
        <p>Usuarios</p>
      </div>
      <div class="grupo-boton-nuevo">
        <button onclick="window.location.href='ControladorUsuarioRegistro?menu=UsuarioRegistro&accion=Formulario'">
            <i class="uil uil-plus"></i>
            Nuevo
        </button>
      </div>
    </article>
        
        <br>
        <br>
        <br>

    <article class="bg-container-body">
      <div class="container-body">
        <table class="table table-striped table-inverse table-responsive">
          <thead class="thead-inverse">
            <tr>
              <th>Empleado</th>
              <th>Usuario</th>
              <th>Clave</th>
              <th>Editar</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="usuario" items="${listaUsuarios}">
            <tr>
                <td>${usuario.getEmpleado()}</td>
                <td>${usuario.getUsuario()}</td>
                <td>${usuario.getClave()}</td>
                <td>
                  <button onclick="window.location.href='ControladorUsuarioEditar?menu=UsuariosEditar&accion=Editar&id=${usuario.getId()}'" 
                          class="btn-option-table btn-editar">
                    <i class="uil uil-pen"></i>
                  </button>
                </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </article>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/ListadoDatosClientes/MostrarClientes.js" 
                type="text/javascript">
        </script>
        
    </body>
</html>

