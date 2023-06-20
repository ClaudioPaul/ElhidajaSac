<%-- 
    Document   : RegistroEmpleados
    Created on : 18 jun. 2023, 23:31:33
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
              href="Vista/Modules/Configuracion/ConfiguracionBasica/Empleados/Componentes/Page/RegistrarEmpleados/RegistroEmpleados.css"
        />
    </head>
    <body>
        <br>
        <br>
        <br>
        <br>
        <center>
        <div id="myModal" class="modal">
            <center><h2>REGISTRAR EMPLEADOS</h2></center>
        <div class="modal-content">
            <form class="ConsultarRuc" action="ControladorEmpleadoRegistro?menu=EmpleadoRegistro" method="POST">
                <input type="text" name="txtBuscarDNI" placeholder="Ingresar DNI">
                <input type="submit" name="accion" value="Buscar" id="buscarBtnModal">
            </form>
    <div class="ContenerdorFormularioRegistro">
        <form class="FormularioRegistro" action="ControladorEmpleadoRegistro?menu=EmpleadoRegistro" method="POST">                        
            <div class="Grupos">
                <label>Tipo de Documento:</label>
                <select name="txtTipoDoc">
                    <option value="0"></option>
                    <option value="DNI">DNI</option>
                    <option value="Carnet">Carnet de Extrangeria</option>
                </select>
            </div>
            <div class="Grupos">
                <label>Numero de Documento:</label>
                <input type="text" value="${Api.getDni()}" name="txtDni" required>
            </div>
            <div class="Grupos">
                <label>Nombres:</label>
                <input type="text" value="${Api.getNombres()}" name="txtNombres" required>
            </div>
            <div class="Grupos">
                <label>Apellidos:</label>
                <input type="text" value="${Api.getApellidos()}" name="txtApellidos" required>
            </div>
            <div class="GruposSelect">
                <div class="Enlinea">
                    <label>Tipo de Empleado:</label>
                <select name="txtTipoEmpelado">
                    <option value="0"></option>
                    <c:forEach var="tip" items="${listaTipo}">
                        <option value="${tip.getId()}">${tip.getTipoEmpleado()}</option>
                    </c:forEach>
                </select>
                </div>
                <div class="Enlinea">
                    <label>Empresa:</label>
                    <select name="txtEmpresa">
                        <option value="0"></option>
                        <c:forEach var="empr" items="${listaEmpresas}">
                            <option value="${empr.getId()}">${empr.getRazonSocial()}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="Grupos">
                <label>Telefono:</label>
                <input type="text" name="txtTelefono" required>
            </div>
            <div class="Grupos">
                <label>Correo:</label>
                <input type="text" name="txtCorreo" required>
            </div>
            <div class="Grupos">
                <label>Dirección:</label>
                <input type="text" name="txtDireccion" required>
            </div>
            <div class="Botones">
                <input type="submit" name="accion" value="Agregar" id="agregarBtn">
            </div>
        </form>
    </div>
    </div>
    </div>
    </center>
    </body>
</html>
