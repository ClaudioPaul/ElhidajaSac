/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


function confirmarEliminacion(id) {
    Swal.fire({
      title: '¿Estás seguro de que deseas eliminar este Material?',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonText: 'Sí, eliminar',
      cancelButtonText: 'Cancelar',
    }).then((result) => {
      if (result.isConfirmed) {
        window.location.href = `ControladorMateriales?menu=Materiales&accion=Eliminar&id=${id}`;
        Swal.fire({
          title: 'Material Eliminado',
          icon: 'success',
          showConfirmButton: false,
          timer: 1500
        });
      }
    });
  }