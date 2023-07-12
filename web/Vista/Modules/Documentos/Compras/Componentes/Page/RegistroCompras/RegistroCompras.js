/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


document.getElementById("agregarBtn").addEventListener("click", function() {
    var materialSelect = document.getElementById("selectMaterial");
    var cantidadInput = document.getElementsByName("txtCantidad")[0];
    var precioInput = document.getElementsByName("txtPrecio")[0];

    var materialId = materialSelect.value; // Obtener el valor del ID del material seleccionado
    var materialNombre = materialSelect.options[materialSelect.selectedIndex].text;
    var cantidad = cantidadInput.value;
    var precio = precioInput.value;

    var subtotal = cantidad * precio;

    var tablaComprasBody = document.getElementById("tablaComprasBody");
    var newRow = tablaComprasBody.insertRow();

    var materialIdCell = newRow.insertCell(); // Insertar celda para el ID del material
    materialIdCell.textContent = materialId; // Mostrar el ID del material

    var materialCell = newRow.insertCell();
    materialCell.textContent = materialNombre;

    var cantidadCell = newRow.insertCell();
    cantidadCell.textContent = cantidad;

    var precioCell = newRow.insertCell();
    precioCell.textContent = precio;

    var subtotalCell = newRow.insertCell();
    subtotalCell.textContent = subtotal;

    var accionesCell = newRow.insertCell(); // Agregar celda para las acciones
    var deleteIcon = document.createElement("i"); // Crear el ícono de eliminación
    deleteIcon.className = "uil uil-trash";
    deleteIcon.addEventListener("click", function() {
        var row = this.parentNode.parentNode; // Obtener la fila a eliminar
        var subtotal = parseFloat(row.cells[4].textContent); // Obtener el subtotal de la fila
        tablaComprasBody.removeChild(row); // Eliminar la fila
        actualizarTotal(-subtotal); // Restar el subtotal eliminado al total
    });
    accionesCell.appendChild(deleteIcon); // Agregar el ícono de eliminación a la celda de acciones

    actualizarTotal(); // Llamar a la función para actualizar el total

    cantidadInput.value = "";
    precioInput.value = "";

    // Agregar los datos a un array para enviar al controlador
 var tablaCompras = [];
    var rows = tablaComprasBody.rows;

    for (var i = 0; i < rows.length; i++) {
        var row = rows[i];
        var data = {
            id: row.cells[0].textContent,
            material: row.cells[1].textContent,
            cantidad: row.cells[2].textContent,
            precio: row.cells[3].textContent,
            subtotal: row.cells[4].textContent
        };
        tablaCompras.push(data);
    }

    var tablaComprasInput = document.createElement("input");
    tablaComprasInput.type = "hidden";
    tablaComprasInput.name = "tablaCompras";
    tablaComprasInput.value = JSON.stringify(tablaCompras);
    document.getElementById("formCompras").appendChild(tablaComprasInput);
});

function actualizarTotal() {
    var subtotalCells = document.querySelectorAll("#tablaComprasBody td:nth-child(5)");
    var total = 0;

    subtotalCells.forEach(function(cell) {
        var subtotal = parseFloat(cell.textContent);
        subtotal = subtotal.toFixed(2); // Redondear el subtotal a 2 decimales
        total += parseFloat(subtotal);
        cell.textContent = subtotal; // Actualizar el contenido de la celda con el subtotal redondeado
    });

    var totalLabel = document.getElementById("totalLabel");
    var totalInput = document.getElementById("txtTotal");

    totalLabel.textContent = "Total: " + total.toFixed(2); // Mostrar el total con 2 decimales redondeados
    totalInput.value = total.toFixed(2); // Asignar el total al valor del input
}

// Luego de asignar el total al cargar la página, llamar a la función actualizarTotal()
actualizarTotal();


$(document).ready(function() {
    $('#selectMaterial').select2();
});