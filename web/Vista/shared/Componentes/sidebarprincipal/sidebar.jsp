<%-- 
    Document   : sidebar
    Created on : 18 jun. 2023, 23:04:10
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ELHIDAJA</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="Vista/shared/Componentes/sidebarprincipal/sidebar.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
        <link
            href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,500;0,600;1,400&display=swap"
            rel="stylesheet"
        />
        <link
            rel="stylesheet"
            href="https://unicons.iconscout.com/release/v4.0.8/css/line.css"
        />
    </head>
    <body>
        <nav class="sidebar">
        <img src="images/logo-elhidaja.png" class="imgRedonda"/>
      <a href="#" class="logo">
          Elhidaja
      </a>
        <hr/>
        <br>
      <div class="menu-content">
        <ul class="menu-items">
          <li class="item">
            <a href="#" target="myFrame">
                <i class="uil uil-estate"></i>
                Inicio
            </a>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>
                  <i class="uil uil-server"></i>
                  Mantenedores
              </span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Mantenedores
              </div>
              <li class="item">
                <a href="ControladorEmpresas?menu=Empresas&accion=Listar" target="myFrame">
                    <i class="uil uil-building"></i>
                    Empresas
                </a>
              </li>
              <li class="item">
                <a href="ControladorEmpleado?menu=Empleado&accion=Listar" target="myFrame">
                    <i class="uil uil-users-alt"></i>
                    Empleados
                </a>
              </li>
              <li class="item">
                <a href="ControladorUsuario?menu=Usuarios&accion=Listar" target="myFrame">
                    <i class="uil uil-user-plus"></i>
                    Usuarios
                </a>
              </li>
              <li class="item">
                <a href="ControladorAuto?menu=Auto&accion=Listar" target="myFrame">
                      <i class="uil uil-bus-alt"></i>
                      Autos
                </a>
              </li>
              <li class="item">
                <a href="ControladorProveedores?menu=Proveedores&accion=Listar" target="myFrame">
                    <i class="uil uil-chat-bubble-user"></i>
                    Proveedores
                </a>
              </li>
              <li class="item">
                <a href="ControladorMateriales?menu=Materiales&accion=Listar" target="myFrame">
                    <i class="uil uil-truck-loading"></i>
                    Materiales
                </a>
              </li>
            </ul>
          </li>
          <li class="item">
            <a href="ControladorCompras?menu=Compras&accion=Listar" target="myFrame">
                <i class="uil uil-shopping-cart"></i>
                Compras
            </a>
          </li>
          <li class="item">
            <a href="ControladorActividades?menu=Actividades&accion=Listar" target="myFrame">
                <i class="uil uil-comment-alt-chart-lines"></i>
                Actividades
            </a>
          </li>
          <li class="item">
            <div class="submenu-item">
              <span>
                  <i class="uil uil-chart-bar"></i>
                  Reportes
              </span>
              <i class="fa-solid fa-chevron-right"></i>
            </div>
            <ul class="menu-items submenu">
              <div class="menu-title">
                <i class="fa-solid fa-chevron-left"></i>
                Reportes
              </div>
              <li class="item">
                <a href="ControladorKardex?menu=Kardex&accion=Listar" target="myFrame">
                    <i class="uil uil-chart"></i>
                    Kardex
                </a>
              </li>
              <li class="item">
                <a href="#" target="myFrame">
                    <i class="uil uil-clipboard-alt"></i>
                    R. Actividades
                </a>
              </li>
            </ul>
          </li>
        </ul>
      </div>
    </nav>
      <%-- 
      
      --%>
    <nav class="navbar">
      <div class="container-fluid">
            <div class="navbar-right">
              <div class="dropdown">
                <button style="border: none" class="btn" 
                        type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  ${Usuario.getNombres()}
                </button>
                <center>
                <div class="Logueo" aria-labelledby="dropdownMenuButton">
                    <a href="#">
                        <img src="images/usuario.png" alt="60" width="60"/>
                    </a>
                  <a  href="#">Usuario</a>
                  <input type="hidden" value="${Usuario.getId()}" name="txtPersonalLogeado">
                  <a  href="#">${Usuario.getUsuario()}</a>
                  <form action="Validar" method="POST">
                      <button class="botonsalir" name="accion" value="Salir" href="Vistas/Login/Login.jsp">Cerrar Sesión</button>
                  </form>
                </div>
                </center>
              </div>
            </div>
        </div>
      <i class="fa-solid fa-bars" id="sidebar-close"></i>
    </nav>
    <main class="main">
      <iframe
        name="myFrame"
        style="height: 100%; width: 100%; border: none">
      </iframe>
    </main>
      <script src="Vista/shared/Componentes/sidebarprincipal/sidebar.js" type="text/javascript"></script>
      <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <% String mensaje = (String) request.getAttribute("mensaje"); %>
        <% if (mensaje != null && mensaje.equals("error") && !mensaje.isEmpty()) { %>
          <script>
            swal({
              title: "Credenciales incorrectas",
              text: "Verifica Usuario y Contraseña",
              icon: "error",
            });
          </script>
        <% } else if (mensaje != null) { %>
          <script>
            swal({
            title: '<%= mensaje %>',
            text: "Mensaje de Bienvenida",
            icon: "images/iconmensaje.gif",
            button: "OK",
            }).then((value) => {
              if (value) {
                // Aquí puedes redirigir a otra página o realizar alguna acción adicional
              }
            });
          </script>
        <% } %>
    </body>
</html>
