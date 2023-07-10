<%-- 
    Document   : RegistrarProveedores
    Created on : 9 jul. 2023, 22:50:16
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;1,400&display=swap"
            rel="stylesheet"
        />
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"/>
        <link rel="stylesheet" 
              href="Vista/Modules/Configuracion/ConfiguracionOtros/Proveedores/Componentes/Page/RegistroProveedores/RegistrarProveedores.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
            <div class="grupo-boton-nuevo">
            <button onclick="window.location.href='ControladorProveedores?menu=Proveedores&accion=Listar'">
                <i class="uil uil-list-ul"></i>
                Mostrar Proveedores
            </button>
            </div>
        <div id="myModal" class="modal">
            <center><h2>REGISTRAR PROVEEDORES</h2></center>
            <div class="modal-content">
                <div class="FormularioBuscar">
                    <form class="ConsultarRuc" action="ControladorProveedoresRegistro?menu=ProveedoresRegistro" method="POST">
                        <input type="number" name="txtBuscarRuc" placeholder="Ingresar RUC" maxlength="11" oninput="validarLongitud(this)" required>
                        <input type="submit" name="accion" value="Buscar" id="buscarBtnModal">
                    </form>
                </div>
                <div class="ContenerdorFormularioRegistro">
                    <form class="FormularioRegistro" action="ControladorProveedoresRegistro?menu=ProveedoresRegistro" method="POST">
                      <div class="Grupos">
                        <label>Ruc:</label>
                        <input type="text" value="${Api.getRuc()}" name="txtRuc" required readonly>
                      </div>
                      <div class="Grupos">
                        <label>Razón Social:</label>
                        <input type="text" value="${Api.getRasonsocial()}" name="txtRazonsocial" required readonly>
                      </div>
                      <div class="Grupos">
                        <label>Dirección de la Empresa:</label>
                        <input type="text" value="${Api.getDireccion()}" name="txtDireccion" required>
                      </div>
                      <div class="Grupos">
                        <label>Nombre del Representante Legal:</label>
                        <input type="text" name="txtNombre" required>
                      </div>
                      <div class="Grupos">
                        <label>Apellidos del Representante Legal:</label>
                        <input type="text" name="txtApellidos" required>
                      </div>
                      <div class="Grupos">
                        <label>Telefono:</label>
                        <input type="number" name="txtTelefono" maxlength="9" oninput="validarLongitud(this)" required>
                      </div>
                        <div class="Botones">
                          <input type="submit" name="accion" value="Agregar" id="agregarBtn">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Proveedores/Componentes/Page/RegistroProveedores/RegistrarProveedores.js" 
                type="text/javascript">
        </script>
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
                  window.location.href = 'ControladorProveedores?menu=Proveedores&accion=Listar';
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
              });
            </script>
          <% } else if (request.getAttribute("MensajeErrorEstado") != null) { %>
            <%-- Obtener el mensaje de error de la solicitud --%>
            <% String mensajeError = (String) request.getAttribute("MensajeErrorEstado"); %>

            <%-- Mostrar el mensaje de error utilizando SweetAlert con dos botones --%>
            <script>
              Swal.fire({
                icon: 'warning',
                text: '<%= mensajeError %>',
                showCancelButton: true,
                confirmButtonText: 'SI',
                cancelButtonText: 'NO'
              }).then((result) => {
                if (result.isConfirmed) {
                  window.location.href = 'ControladorProveedoresRegistro?menu=ProveedoresRegistro&accion=Activar';
                }
              });
            </script>
          <% } %>
          
          
          
          
          
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
          
    </body>
</html>

