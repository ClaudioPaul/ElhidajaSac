<%-- 
    Document   : MostrarAutos
    Created on : 18 jun. 2023, 23:20:56
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
            href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"/>
        <link rel="stylesheet" href="Vista/Modules/Configuracion/ConfiguracionOtros/Autos/Componentes/Page/MostrarAutos/MostrarAutos.css"/>
        <title>Autos</title>
    </head>
    <body>
        <br>
        <br>
        <br>
        
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-bus-alt"></i>
        </div>
        <p>Autos</p>
      </div>
      <form action="ControladorAutoRegistro?menu=AutoRegistro" method="POST">
      <div class="grupo-boton-nuevo">
        <button type="submit" name="accion" value="Formulario">
            <i class="uil uil-plus"></i>
            Nuevo
        </button>
      </div>
      </form>
    </article>
    <article class="opciones-listado">
      <div class="grupo-boton-nuevo">
        <button onclick="window.location.href='ControladorAuto?menu=Auto&accion=Listar'">
            <i class="uil uil-list-ul"></i>
            Listar Todo
        </button>
      </div>
      <form action="ControladorAuto?menu=Auto" method="POST">
        <div class="grupo-buscar">
          <input type="search" placeholder="Ingresar Matricula a buscar" value="" name="txtBuscar" required/>
          <button type="submit" name="accion" value="Buscar"><i class="uil uil-search"></i>Buscar</button>
        </div>
      </form>
    </article>

    <article class="bg-container-body">
      <div class="container-body">
        <table class="table table-striped table-inverse table-responsive">
          <thead class="thead-inverse">
            <tr>
                <th>Matricula</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Generación</th>
                <th>Empresa</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="empresa" items="${listaEmpelados}">
            <tr>
                <td>${empresa.getMatricula()}</td>
                <td>${empresa.getMarca()}</td>
                <td>${empresa.getModelo()}</td>
                <td>${empresa.getGeneracion()}</td>
                <td>${empresa.getEmpresa()}</td>
                <td>
                  <button onclick="window.location.href='ControladorAutoEditar?menu=AutoEditar&accion=Editar&id=${empresa.getId()}'"
                          class="btn-option-table btn-editar">
                    <i class="uil uil-pen"></i>
                  </button>
                </td>
                <td>
                    <button onclick="confirmarEliminacion(${empresa.getId()})"
                          class="btn-option-table btn-eliminar">
                        <i class="uil uil-trash"></i>
                    </button>
                </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </article>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Autos/Componentes/Page/MostrarAutos/MostrarAutos.js" 
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
                window.location.href = 'ControladorAuto?menu=Auto&accion=Listar';
              }
            });
          </script>
        <% } %>
    </body>
</html>

