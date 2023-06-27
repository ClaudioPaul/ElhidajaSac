<%-- 
    Document   : RegistroActividades
    Created on : 18 jun. 2023, 23:44:01
    Author     : CLAUDIO CRUZADO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Registro de Actividades</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }

        form {
            margin-bottom: 20px;
        }

        input[type="text"], select, textarea {
            width: 300px;
        }

        input[type="submit"] {
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h1>Registro de Actividades</h1>

    <h2>Autos</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Marca</th>
            <th>Modelo</th>
        </tr>
        <!-- Aquí puedes insertar código para mostrar los datos de la tabla de autos -->
    </table>

    <h2>Empleados</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Nombre</th>
            <th>Apellido</th>
        </tr>
        <!-- Aquí puedes insertar código para mostrar los datos de la tabla de empleados -->
    </table>

    <h2>Actividades</h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Cliente</th>
            <th>Auto</th>
            <th>Descripción de Actividad</th>
            <th>Materiales</th>
            <th>Cantidad de Actividades</th>
            <th>Precio</th>
            <th>Total</th>
        </tr>
        <!-- Aquí puedes insertar código para mostrar los datos de la tabla de actividades -->
    </table>

    <h2>Registrar Actividad</h2>
    <form action="ruta_a_tu_servlet_o_script" method="POST">
        <label>Cliente:</label>
        <input type="text" name="cliente" required><br>

        <label>Auto:</label>
        <select name="auto" required>
            <!-- Aquí puedes insertar código para mostrar opciones de autos -->
        </select><br>

        <label>Descripción de Actividad:</label>
        <textarea name="descripcion" required></textarea><br>

        <label>Materiales:</label>
        <textarea name="materiales" required></textarea><br>

        <label>Cantidad de Actividades:</label>
        <input type="number" name="cantidad" required><br>

        <label>Precio:</label>
        <input type="number" name="precio" required><br>

        <label>Total:</label>
        <input type="number" name="total" required><br>

        <input type="submit" value="Registrar">
    </form>
</body>
</html>