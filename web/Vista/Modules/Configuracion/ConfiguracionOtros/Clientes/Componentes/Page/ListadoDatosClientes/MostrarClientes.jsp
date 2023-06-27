    <%-- 
    Document   : Clientes
    Created on : 18 jun. 2023, 23:12:31
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
            href="Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/ListadoDatosClientes/MostrarClientes.css" 
        />
    </head>
    <body>
        <br>
        <br>
        <br>
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-building"></i>
        </div>
        <p>Empresas</p>
      </div>
      <div class="grupo-boton-nuevo">
        <button onclick="window.location.href='ControladorEmpresasRegistro?menu=EmpresasRegistro&accion=Formilario'">
            <i class="uil uil-plus"></i>
            Nuevo
        </button>
      </div>
    </article>
    <article class="opciones-listado">
      <div class="grupo-btn-opciones">
        <button id="btnDescargarPDF" onclick="descargarPDF()">
            <i class="uil uil-download-alt"></i>Descargar PDF
        </button>
      </div>
      <form action="ControladorEmpresas?menu=Empresas" method="POST">  
        <div class="grupo-buscar">
          <input type="search" placeholder="Ingresar la Razón Social a Buscar" name="txtBuscar" />
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
              <th>Ruc</th>
              <th>Razón social</th>
              <th>Representante</th>
              <th>Dirección</th>
              <th>Telefono</th>
              <th>Correo</th>
              <th>Editar</th>
              <th>Eliminar</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="empresa" items="${listaEmpresas}">
            <tr>
                <td>${empresa.getRuc()}</td>
                <td>${empresa.getRazonSocial()}</td>
                <td>${empresa.getNombreRepresentante()}</td>
                <td>${empresa.getDireccion()}</td>
                <td>${empresa.getTelefono()}</td>
                <td>${empresa.getCorreo()}</td>
                <td>
                  <button onclick="window.location.href='ControladorEmpresasEditar?menu=EmpresasEditar&accion=Editar&id=${empresa.getId()}'" 
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
