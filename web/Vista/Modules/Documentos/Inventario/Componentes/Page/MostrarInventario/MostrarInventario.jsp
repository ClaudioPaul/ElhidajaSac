<%-- 
    Document   : MostrarInventario
    Created on : 18 jun. 2023, 23:42:32
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
        href="Vista/Modules/Documentos/Inventario/Componentes/Page/MostrarInventario/MostrarInventario.css" 
    />
</head>
<body>
<br>
<br>
<br>
<article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-file-minus-alt"></i>
        </div>
        <p>KARDEX</p>
      </div>
    </article>
    <div class="container">
        <div class="table-container">
            <h2>Entradas</h2>
            <table class="table table-striped table-inverse table-responsive">
                <thead class="thead-inverse">
                    <tr>
                        <th>Materiales</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="empresa" items="${listaEntradas}">
                        <tr>
                            <td>${empresa.getMateriales()}</td>
                            <td>${empresa.getCatidad()}</td>
                            <td>S/. ${empresa.getPrecio()}</td>
                            <td>S/. ${empresa.getSubtotal()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
        <div class="table-container">
            <h2>Salidas</h2>
            <table class="table table-striped table-inverse table-responsive">
                <thead class="thead-inverse">
                    <tr>
                        <th>Materiales</th>
                        <th>Cantidad</th>
                        <th>Precio</th>
                        <th>Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="salida" items="${listaSalidas}">
                        <tr>
                            <td>${salida.getId()}</td>
                            <td>${salida.getMateriales()}</td>
                            <td>${salida.getCantidad()}</td>
                            <td>${salida.getPrecio()}</td>
                            <td>${salida.getSubtotal()}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/ListadoDatosClientes/MostrarClientes.js" 
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
                    window.location.href = 'ControladorEmpresas?menu=Empresas&accion=Listar';
                }
            });
        </script>
    <% } %>
    
    <script>
        function descargarPDF() {
            // Enviar una solicitud al servidor para generar el PDF
            fetch('Vista\Modules\Configuracion\ConfiguracionOtros\Clientes\Componentes\Page\ListadoDatosClientes\generarPDF.jsp', {
                method: 'GET'
            })
            .then(response => response.blob())
            .then(blob => {
                // Crear un objeto URL para el blob del PDF
                const url = URL.createObjectURL(blob);

                // Crear un elemento de enlace para iniciar la descarga del PDF
                const link = document.createElement('a');
                link.href = url;
                link.download = 'lista_clientes.pdf'; // Nombre del archivo PDF
                link.click();

                // Liberar el objeto URL
                URL.revokeObjectURL(url);
            })
            .catch(error => {
                console.error('Error al generar el PDF:', error);
            });
        }
    </script>
</body>
</html>