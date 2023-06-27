<%-- 
    Document   : RegistroClientes
    Created on : 18 jun. 2023, 23:13:52
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
            <center><h2>ACTUALIZAR EMPRESAS</h2></center>
            <div class="modal-content">
                <div class="ContenerdorFormularioRegistro">
                    <form class="FormularioRegistro" action="ControladorEmpresasEditar?menu=EmpresasEditar" method="POST">
                        <div class="Grupos">
                            <label>Ruc:</label>
                            <input type="text" value="${listaEmpresa.getRuc()} "name="txtRuc" required disabled>
                        </div>
                        <div class="Grupos">
                            <label>Razón Social:</label>
                            <input type="text" value="${listaEmpresa.getRazonSocial()}" name="txtRazonsocial" required disabled>
                        </div>
                        <div class="Grupos">
                            <label>Dirección de la Empresa:</label>
                            <input type="text" value="${listaEmpresa.getDireccion()}" name="txtDireccion" required>
                        </div>
                        <div class="Grupos">
                            <label>Nombre del Representante Legal:</label>
                            <input type="text" value="${listaEmpresa.getNombreRepresentante()}" name="txtNombre" required>
                        </div>
                        <div class="Grupos">
                            <label>Apellidos del Representante Legal:</label>
                            <input type="text" value="${listaEmpresa.getApellidoRepresentante()}" name="txtApellidos" required>
                        </div>
                        <div class="Grupos">
                            <label>Telefono:</label>
                            <input type="number" value="${listaEmpresa.getTelefono()}" name="txtTelefono" required>
                        </div>
                        <div class="Grupos">
                            <label>Correo:</label>
                            <input type="email"value="${listaEmpresa.getCorreo()}"  name="txtCorreo" required>
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
                  window.location.href = 'ControladorEmpresas?menu=Empresas&accion=Listar';
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
