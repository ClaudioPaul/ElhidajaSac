/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function confirmarEliminacion(id) {
    Swal.fire({
      title: '¿Estás seguro de que deseas eliminar el Auto?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = `ControladorAuto?menu=Auto&accion=Eliminar&id=${id}`;
        Swal.fire({
          title: 'Auto Eliminado',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        });
      }
    });
  }