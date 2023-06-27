/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


// Confirmar si se desea eliminar una empresa 

function confirmarEliminacion(id) {
    Swal.fire({
      title: '¿Estás seguro de que deseas eliminar esta empresa?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = `ControladorEmpresas?menu=Empresas&accion=Eliminar&id=${id}`;
        Swal.fire({
          title: 'Empresa Eliminada',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        });
      }
    });
  }
