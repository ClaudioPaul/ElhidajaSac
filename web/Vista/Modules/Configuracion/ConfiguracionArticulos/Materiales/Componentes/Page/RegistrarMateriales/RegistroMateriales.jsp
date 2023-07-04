<%-- 
    Document   : RegistrarMateriales
    Created on : 18 jun. 2023, 23:25:48
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" 
              href="Vista\Modules\Configuracion\ConfiguracionOtros\Clientes\Componentes\Page\RegistroClientes\RegistroClientes.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
        <div id="myModal" class="modal">
            <center><h2>REGISTRAR MATERIALES</h2></center>
            <div class="modal-content">
                <div class="FormularioBuscar">
                </div>
                <div class="ContenerdorFormularioRegistro">
                    <form class="FormularioRegistro" action="ControladorMaterialesRegistro?menu=MaterialesRegistro" method="POST">
                      <div class="Grupos">
                        <label>Nombre:</label>
                        <input type="text"  name="txtNombre" required>
                      </div>
                      <div class="Grupos">
                        <label>Descripcion:</label>
                        <input type="text"  name="txtDescripcion" required>
                      </div>
                      <div class="Grupos">
                        <label>Precio:</label>
                        <input type="text"  name="txtPrecio" required>
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
        <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/RegistroClientes/RegistroClientes.js" 
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
                  window.location.href = 'ControladorMateriales?menu=Materiales&accion=Listar';
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

