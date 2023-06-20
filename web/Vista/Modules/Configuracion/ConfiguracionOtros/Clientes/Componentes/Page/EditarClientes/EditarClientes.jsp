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
    </body>
</html>
