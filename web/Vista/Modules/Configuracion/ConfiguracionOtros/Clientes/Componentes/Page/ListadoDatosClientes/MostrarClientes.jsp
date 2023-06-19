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
            href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"/>
        <link rel="stylesheet" href="Vista\Modules\Configuracion\ConfiguracionOtros\Clientes\Componentes\Page\ListadoDatosClientes\MostrarClientes.css"/>
        <title>Clientes</title>
    </head>
    <body>
         <header>
      <h2>Configuración / Clientes</h2>
    </header>
    <article class="encabezado-principal">
      <div class="grupo-principal">
        <div class="icono-encabezado">
          <i class="uil uil-constructor"></i>
        </div>
        <p>Clientes</p>
      </div>
      <div class="grupo-boton-nuevo">
        <button><i class="uil uil-plus"></i>Nuevo</button>
      </div>
    </article>
    <article class="opciones-listado">
      <div class="grupo-btn-opciones">
        <button><i class="uil uil-download-alt"></i>Descargar PDF</button>
      </div>
      <div class="grupo-buscar">
        <input type="search" placeholder="Ingresar valor a buscar" value="" />
        <button><i class="uil uil-search"></i>Buscar</button>
      </div>
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
                  <button class="btn-option-table btn-editar">
                    <i class="uil uil-pen"></i>
                  </button>
                </td>
                <td>
                  <button class="btn-option-table btn-eliminar">
                    <i class="uil uil-trash"></i>
                  </button>
                </td>
            </tr>
            </c:forEach>
          </tbody>
        </table>
      </div>
    </article>
    </body>
</html>
