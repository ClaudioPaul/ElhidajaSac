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
        <title>Editar Clientes</title>
    </head>
    <body>
        <form action="ControladorEmpresasEditar?menu=EmpresasEditar" method="POST">                        
            <div>
                <label>Ruc:</label>
                <input type="text" value="${listaEmpresa.getRuc()} "name="txtRuc">
            </div>
            <div>
                <label>Razón Social:</label>
                <input type="text" value="${listaEmpresa.getRazonSocial()}" name="txtRazonsocial">
            </div>
            <div>
                <label>Dirección de la Empresa:</label>
                <input type="text" value="${listaEmpresa.getDireccion()}" name="txtDireccion">
            </div>
            <div>
                <label>Nombre del Representante Legal:</label>
                <input type="text" value="${listaEmpresa.getNombreRepresentante()}" name="txtNombre">
            </div>
            <div>
                <label>Apellidos del Representante Legal:</label>
                <input type="text" value="${listaEmpresa.getApellidoRepresentante()}" name="txtApellidos">
            </div>
            <div>
                <label>Telefono:</label>
                <input type="number" value="${listaEmpresa.getTelefono()}" name="txtTelefono">
            </div>
            <div>
                <label>Correo:</label>
                <input type="email"value="${listaEmpresa.getCorreo()}"  name="txtCorreo">
            </div>
            <div>
                <input type="submit" name="accion" value="Actualizar">
            </div>
        </form>
    </body>
</html>
