<%-- 
    Document   : MostrarMateriales
    Created on : 18 jun. 2023, 23:24:43
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
              href="Vista\Modules\Configuracion\ConfiguracionOtros\Clientes\Componentes\Page\EditarClientes\EditarClientes.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
            
        <div id="myModal" class="modal">
            <center><h2>ACTUALIZAR MATERIALES</h2></center>
            <div class="grupo-boton-nuevo">
            <button onclick="window.location.href='ControladorMateriales?menu=Materiales&accion=Listar'">
                <i class="uil uil-list-ul"></i>
                Mostrar Materiales
            </button>
            </div>
            <div class="modal-content">
                <div class="ContenerdorFormularioRegistro">
                    <form class="FormularioRegistro" action="ControladorMaterialesEditar?menu=MaterialesEditar" method="POST">
                        <div class="Grupos">
                            <label>Nombre:</label>
                            <input type="text" value="${listaMateriales.getNombre()} "name="txtNombre" required >
                        </div>
                        <div class="Grupos">
                            <label>Descripcion:</label>
                            <input type="text" value="${listaMateriales.getDescripcion()}" name="txtDescripcion" required >
                        </div>
                        <div class="Grupos">
                            <label>Precio:</label>
                            <input type="text" value="${listaMateriales.getPrecio()}" name="txtPrecio" required>
                        </div>
                        <div class="Grupos">
                            <label>Stock:</label>
                            <input type="text" value="${listaMateriales.getStock()}" name="txtStock" disabled>
                        </div>
                        <div class="Botones">
                          <input type="submit" name="accion" value="Actualizar">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </center>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
              }).then((result) => {
                if (result.isConfirmed) {
                  // Redirigir a la URL después de hacer clic en "Aceptar"
                  window.location.href = 'ControladorEmpresas?menu=Empresas&accion=Listar';
                }
              });;
            </script>
          <% } %>
    </body>
</html>

