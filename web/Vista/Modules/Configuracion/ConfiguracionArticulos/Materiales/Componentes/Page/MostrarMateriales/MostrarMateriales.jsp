<%-- 
    Document   : Materiales
    Created on : 18 jun. 2023, 23:09:05
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
        <link rel="stylesheet" href="Vista/Modules/Configuracion/ConfiguracionBasica/Empleados/Componentes/Page/MostrarEmpleados/MostrarEmpleados.css"/>
        <title>Empleados</title>
    </head>
    <body>
        <br>
        <br>
        <br>
        
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-users-alt"></i>
        </div>
        <p>Materiales</p>
      </div>
      <form action="ControladorMaterialesRegistro?menu=MaterialesRegistro" method="POST">
      <div class="grupo-boton-nuevo">
        <button type="submit" name="accion" value="Formulario">
            <i class="uil uil-plus"></i>
            Nuevo
        </button>
      </div>
      </form>
    </article>
    <article class="opciones-listado">
      <div class="grupo-btn-opciones">
        <button><i class="uil uil-download-alt"></i>Descargar PDF</button>
      </div>
      <form action="#" method="POST">
        <div class="grupo-buscar">
          <input type="search" placeholder="Ingresar valor a buscar" value="" name="txtBuscar"/>
          <button type="submit" name="accion" value="Buscar"><i class="uil uil-search"></i>Buscar</button>
          <button type="submit" name="accion" value="Cancelar"><i class="uil uil-times-circle"></i></button>
        </div>
      </form>
    </article>

    <article class="bg-container-body">
      <div class="container-body">
        <table class="table table-striped table-inverse table-responsive">
          <thead class="thead-inverse">
            <tr>
                <th>Nombres</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Stock</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="empresa" items="${listaMateriales}">
            <tr>
                <td>${empresa.getNombre()}</td>
                <td>${empresa.getDescripcion()}</td>
                <td>S/. ${empresa.getPrecio()}</td>
                <td>${empresa.getStock()}</td>
                <td>
                  <button onclick="window.location.href='ControladorMaterialesEditar?menu=MaterialesEditar&accion=Editar&id=${empresa.getId()}'"
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
        <script src="Vista/Modules/Configuracion/ConfiguracionArticulos/Materiales/Componentes/Page/MostrarMateriales/MostrarMateriales.js" 
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
                window.location.href = '#';
              }
            });
          </script>
        <% } %>
    </body>
</html>
