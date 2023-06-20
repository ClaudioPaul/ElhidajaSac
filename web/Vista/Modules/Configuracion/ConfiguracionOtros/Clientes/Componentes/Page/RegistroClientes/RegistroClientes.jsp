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
        <title>Registrar Clientes</title>
    </head>
    <body>
        <form action="ControladorEmpresasRegistro?menu=EmpresasRegistro" method="POST">
            <input type="text" name="txtBuscarRuc" placeholder="Ingresar RUC">
            <input type="submit" name="accion" value="Buscar">
        </form>
        
        <form action="ControladorEmpresasRegistro?menu=EmpresasRegistro" method="POST">                        
            <div>
                <label>Ruc:</label>
                <input type="text" value="${Api.getRuc()}"name="txtRuc">
            </div>
            <div>
                <label>Razón Social:</label>
                <input type="text" value="${Api.getRasonsocial()}" name="txtRazonsocial">
            </div>
            <div>
                <label>Dirección de la Empresa:</label>
                <input type="text" value="${Api.getDireccion()}" name="txtDireccion">
            </div>
            <div>
                <label>Nombre del Representante Legal:</label>
                <input type="text" name="txtNombre">
            </div>
            <div>
                <label>Apellidos del Representante Legal:</label>
                <input type="text" name="txtApellidos">
            </div>
            <div>
                <label>Telefono:</label>
                <input type="number" name="txtTelefono">
            </div>
            <div>
                <label>Correo:</label>
                <input type="email" name="txtCorreo">
            </div>
            <div>
                <input type="submit" name="accion" value="Agregar">
            </div>
        </form>
    </body>
</html>
