/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function validarLongitud(input) {
        var maxLength = parseInt(input.getAttribute("maxlength"));
        if (input.value.length > maxLength) {
            input.value = input.value.slice(0, maxLength);
        }
}
