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
              href="Vista\Modules\Configuracion\ConfiguracionOtros\Clientes\Componentes\Page\RegistroClientes\RegistroClientes.css"
        />
    </head>
    <body>
        <div id="myModal" class="modal">
            <div class="modal-content">
                <form class="ConsultarRuc" action="ControladorEmpresasRegistro?menu=EmpresasRegistro" method="POST">
                  <input type="text" name="txtBuscarRuc" placeholder="Ingresar RUC">
                  <input type="submit" name="accion" value="Buscar" id="buscarBtnModal">
                </form>
                <div class="ContenerdorFormularioRegistro">
                    <form class="FormularioRegistro" action="ControladorEmpresasRegistro?menu=EmpresasRegistro" method="POST">
                      <div class="Grupos">
                        <label>Ruc:</label>
                        <input type="text" value="${Api.getRuc()}" name="txtRuc" required disabled>
                      </div>
                      <div class="Grupos">
                        <label>Razón Social:</label>
                        <input type="text" value="${Api.getRasonsocial()}" name="txtRazonsocial" required disabled>
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
                        <input type="number" name="txtTelefono" required>
                      </div>
                      <div class="Grupos">
                        <label>Correo:</label>
                        <input type="email" name="txtCorreo" required>
                      </div>
                      <center>
                        <div class="Botones">
                          <input type="submit" name="accion" value="Agregar" id="agregarBtn">
                        </div>
                      </center>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
