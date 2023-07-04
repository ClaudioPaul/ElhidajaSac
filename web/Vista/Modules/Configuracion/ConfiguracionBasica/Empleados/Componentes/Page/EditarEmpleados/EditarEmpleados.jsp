<%-- 
    Document   : EditarEmpleados
    Created on : 18 jun. 2023, 23:30:37
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
              href="Vista/Modules/Configuracion/ConfiguracionBasica/Empleados/Componentes/Page/EditarEmpleados/EditarEmpleados.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
        <div id="myModal" class="modal">
            <center><h2>EDITAR EMPLEADOS</h2></center>
        <div class="modal-content">
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorEmpleadoEditar?menu=EmpleadoEditar" method="POST">                        
            <div class="Grupos">
                <label>Tipo de Documento:</label>
                <select name="txtTipoDoc">
                    <option value="0">${listaEmpleados.getTipoDocumento()}</option>
                    <option value="DNI">DNI</option>
                    <option value="Carnet">Carnet de Extrangeria</option>
                </select>
            </div>
            <div class="Grupos">
                <label>Numero de Documento:</label>
                <input type="text" value="${listaEmpleados.getNumeroDocumento()}" name="txtDni" required>
            </div>
            <div class="Grupos">
                <label>Nombres:</label>
                <input type="text" value="${listaEmpleados.getNombres()}" name="txtNombres" required>
            </div>
            <div class="Grupos">
                <label>Apellidos:</label>
                <input type="text" value="${listaEmpleados.getApellidos()}" name="txtApellidos" required>
            </div>
            <div class="GruposSelect">
                <div class="Enlinea">
                    <label>Tipo de Empleado:</label>
                <select name="txtTipoEmpelado">
                    <option value="${listaEmpleados.getIdTipoEmpleado()}">${listaEmpleados.getTipoEmpleado()}</option>
                    <c:forEach var="tip" items="${listaTipo}">
                        <option value="${tip.getId()}">${tip.getTipoEmpleado()}</option>
                    </c:forEach>
                </select>
                </div>
                <div class="Enlinea">
                    <label>Empresa:</label>
                    <select name="txtEmpresa">
                        <option value="${listaEmpleados.getIdEmpresaTerciaria()}">${listaEmpleados.getEmpresaTercearia()}</option>
                        <c:forEach var="empr" items="${listaEmpresas}">
                            <option value="${empr.getId()}">${empr.getRazonSocial()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="Grupos">
                <label>Telefono:</label>
                <input type="text" value="${listaEmpleados.getTelefono()}" name="txtTelefono" required>
            </div>
            <div class="Grupos">
                <label>Correo:</label>
                <input type="text" value="${listaEmpleados.getCorreo()}" name="txtCorreo" required>
            </div>
            <div class="Grupos">
                <label>Dirección:</label>
                <input type="text" Value="${listaEmpleados.getDireccion()}" name="txtDireccion" required>
            </div>
            <div class="Botones">
                <input type="submit" name="accion" value="Actualizar" id="agregarBtn">
            </div>
        </form>
    </div>
    </div>
    </div>
    </center>
    </body>
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
                  window.location.href = 'ControladorEmpleado?menu=Empleado&accion=Listar';
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
                  window.location.href = 'ControladorEmpleado?menu=Empleado&accion=Listar';
                }
              });;
            </script>
          <% } %>
</html>

