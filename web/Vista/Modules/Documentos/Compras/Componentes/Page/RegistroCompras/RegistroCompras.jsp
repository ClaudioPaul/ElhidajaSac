<%-- 
    Document   : RegistroCompras
    Created on : 18 jun. 2023, 23:40:14
    Author     : CLAUDIO CRUZADO
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;1,400&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.8/css/line.css" />
    <link rel="stylesheet" href="Vista/Modules/Documentos/Compras/Componentes/Page/RegistroCompras/RegistroCompras.css" />
</head>
<body>
    
    <br>
    <br>
    
    <center>
        <h2>REGISTRAR COMPRAS</h2>
    </center>

    <div class="Botones">
        <button type="button" id="agregarBtn">Agregar</button>
    </div>
    <form action="ControladorCompraRegistro?menu=CompraRegistro" method="POST" id="formCompras">
    <div class="form-container">
        <div class="FormularioRegistro">
            
            <div class="Grupos">
                <label>Proveedores:</label>
                <select name="txtProveedor">
                    <option value="0"></option>
                    <c:forEach var="marca" items="${listaproveedores}">
                        <option value="${marca.getId()}">${marca.getRazonSocial()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Fecha:</label>
                <input type="date" name="txtFecha" required>
            </div>
            <div class="Grupos">
                <label>Serie:</label>
                <input type="text" name="txtSerie" required>
            </div>
            <div class="Grupos">
                <label>Correlativo:</label>
                <input type="number" name="txtCorrelativo" required>
            </div>
            <div class="Grupos">
                <label>Total:</label>
                <input type="number" name="txtTotal" id="txtTotal" step="0.01" min="0" max="1000" readonly>
            </div>
            <div class="Botones">
                <button type="submit" name="accion" value="Agregar">Guardar</button>
            </div>
        </div>
        
        <div class="FormularioRegistro">                        
            <div class="Grupos">
                <label>Materiales:</label>
                <select id="selectMaterial" name="txtMarca">
                    <option value="0"></option>
                    <c:forEach var="material" items="${listaMateriales}">
                        <option value="${material.getId()}">${material.getNombre()}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="Grupos">
                <label>Cantidad:</label>
                <input type="number" name="txtCantidad">
            </div>
            <div class="Grupos">
                <label>Precio:</label>
                <input type="number" name="txtPrecio" step="0.01" min="0" max="1000">
            </div>
        </div>
        
    </div>      
    </form>
    <center>
    <table class="table table-striped table-inverse table-responsive">
        <thead class="thead-inverse">
            <tr>
                <th>Id</th>
                <th>Material</th>
                <th>Cantidad</th>
                <th>Precio</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody id="tablaComprasBody" name="tablaComprasBody">
            <!-- Aquí se agregarán las filas dinámicamente -->
        </tbody>
            
    </table>
    </center>
    <div class="Botones">
        <span id="totalLabel">Total: 0</span>
    </div>
    
    <input type="hidden" name="tablaCompras" id="tablaComprasInput" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Vista/Modules/Documentos/Compras/Componentes/Page/RegistroCompras/RegistroCompras.js" type="text/javascript"></script>
    
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
                    window.location.href = 'ControladorCompras?menu=Compras&accion=Listar';
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
    
</body>
</html>