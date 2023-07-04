<%-- 
    Document   : RegistroCompras
    Created on : 18 jun. 2023, 23:40:14
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
              href="Vista/Modules/Documentos/Compras/Componentes/Page/RegistroCompras/RegistroCompras.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
        <div id="myModal" class="modal">
            <center><h2>REGISTRAR COMPRAS</h2></center>
    <div class="modal-content">
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorAutoRegistro?menu=AutoRegistro" method="POST">                        
            <div class="Grupos">
                <label>Proveedores:</label>
                <select name="txtMarca">
                    <option value="0"></option>
                    <c:forEach var="marca" items="${listaproveedores}">
                        <option value="${marca.getId()}">${marca.getRazonSocial()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Fecha:</label>
                <input type="Date"  name="txtFecha" required>
            </div>
            <div class="Grupos">
                <label>Serie:</label>
                <input type="text"  name="txtSerie" required>
            </div>
            <div class="Grupos">
                <label>Correlativo:</label>
                <input type="number"  name="txtCorrelativo" required>
            </div>
        </form>
    </div>
            
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorAutoRegistro?menu=AutoRegistro" method="POST">                        
            <div class="Grupos">
                <label>Materiales:</label>
                <select name="txtMarca">
                    <option value="0"></option>
                    <c:forEach var="marca" items="${listaMateriales}">
                        <option value="${marca.getId()}">${marca.getNombre()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Cantidad:</label>
                <input type="text"  name="txtCantidad" required>
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
    
    <article class="bg-container-body">
      <div class="container-body">
        <table class="table table-striped table-inverse table-responsive">
          <thead class="thead-inverse">
            <tr>
              <th>Material</th>
              <th>Cantidad</th>
              <th>Precio</th>
              <th>Subtotal</th>
              <th>Total</th>
            </tr>
          </thead>
          <tbody>
            
            <tr>
                <td>Soldadura</td>
                <td>20</td>
                <td>10</td>
                <td>200</td>
                <td>200</td>
            </tr>
          </tbody>
        </table>
      </div>
    </article>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Autos/Componentes/Page/RegistrarAutos/RegistrarAutos.js" 
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
                  window.location.href = 'ControladorAuto?menu=Auto&accion=Listar';
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
                  window.location.href = 'ControladorAutoRegistro?menu=AutoRegistro&accion=Formulario';
                }
              });
            </script>
          <% } %>
    </body>
</html>


