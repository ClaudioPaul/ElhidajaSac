<%-- 
    Document   : EditarUsuario
    Created on : 18 jun. 2023, 23:33:52
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
              href="Vista/Modules/Configuracion/ConfiguracionBasica/Usuarios/Componentes/Page/RegistrarUsuarios/RegistroUsuarios.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
            <div class="grupo-boton-nuevo">
            <button onclick="window.location.href='ControladorUsuario?menu=Usuarios&accion=Listar'">
                <i class="uil uil-list-ul"></i>
                Mostrar Usuarios
            </button>
            </div>
        <div id="myModal" class="modal">
            <center><h2>EDITAR USUARIOS</h2></center>
        <div class="modal-content">
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorUsuarioEditar?menu=UsuariosEditar" method="POST">                        
            <div class="GruposSelect">
                <div class="Enlinea">
                    <label>Empleado:</label>
                <select name="txtEmpelado">
                    <option value="${listaUsuarios.getIdEmpleado()}">${listaUsuarios.getEmpleado()}</option>
                    <c:forEach var="empelado" items="${listaEmpleado}">
                        <option value="${empelado.getId()}">${empelado.getNombres()}</option>
                    </c:forEach>
                </select>
                </div>
            </div>
            <div class="Grupos">
                <label>Usuario:</label>
                <input type="text" value="${listaUsuarios.getUsuario()}" name="txtUsuario" required>
            </div>
            <div class="Grupos">
                <label>Clave:</label>
                <input type="text" value="${listaUsuarios.getClave()}" name="txtClave" required>
            </div>
            <div class="Botones">
                    <input type="submit" name="accion" value="Actualizar" id="agregarBtn">
            </div>
        </form>
    </div>
    </div>
    </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Vista\Modules\Configuracion\ConfiguracionBasica\Empleados\Componentes\Page\RegistrarEmpleados\RegistroEmpleados.js" 
                type="text/javascript">
    </script>
    <%-- Verificar si existe el atributo "mensaje" --%>
            <% if (request.getAttribute("MensajeErrorBuscar") != null) { %>
              <%-- Obtener el mensaje de la solicitud --%>
              <% String mensaje = (String) request.getAttribute("MensajeErrorBuscar"); %>

              <%-- Mostrar el mensaje utilizando SweetAlert --%>
              <script>
                Swal.fire({
                    icon: 'error',
                    title: 'Error',
                    text: '<%= mensaje %>',
                    confirmButtonText: 'Aceptar',
                    customClass: {
                        confirmButton: 'custom-confirm-button'
                    }
                });
              </script>
            <% } %>
            
            <%-- Verificar si existe el atributo "MensajeConfirmacion" --%>
            <% if (request.getAttribute("MensajeConfirmacion") != null) { %>
              <%-- Obtener el mensaje de confirmación de la solicitud --%>
              <% String mensajeConfirmacion = (String) request.getAttribute("MensajeConfirmacion"); %>

            <%-- Mostrar el mensaje de confirmación utilizando SweetAlert --%>
            <script>
              Swal.fire({
                icon: 'success',
                title: 'Confirmación',
                text: '<%= mensajeConfirmacion %>',
                confirmButtonText: 'Aceptar'
              }).then((result) => {
                if (result.isConfirmed) {
                  // Redirigir a la URL después de hacer clic en "Aceptar"
                  window.location.href = 'ControladorUsuario?menu=Usuarios&accion=Listar';
                }
              });
            </script>
            <% } else if (request.getAttribute("MensajeError") != null) { %>
            <%-- Obtener el mensaje de error de la solicitud --%>
            <% String mensajeError = (String) request.getAttribute("MensajeError"); %>

            <%-- Mostrar el mensaje de error utilizando SweetAlert --%>
            <script>
              Swal.fire({
                icon: 'error',
                title: 'Error',
                text: '<%= mensajeError %>',
                confirmButtonText: 'Aceptar'
              }).then((result) => {
                if (result.isConfirmed) {
                  // Redirigir a la URL después de hacer clic en "Aceptar"
                  window.location.href = 'ControladorUsuarioRegistro?menu=UsuarioRegistro&accion=Formulario';
                }
              });
            </script>
          <% } %>
    </body>
</html>