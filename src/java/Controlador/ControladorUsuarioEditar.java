 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empleados;
import Modelo.Empresas;
import Modelo.TipoEmpleado;
import Modelo.Usuarios;
import ModeloDao.ApiDNIRUC;
import ModeloDao.EmpleadosDao;
import ModeloDao.EmpresasDao;
import ModeloDao.TipoEmpleadoDao;
import ModeloDao.UsuariosDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


/**
 *
 * @author Claudio Cruzado
 */
public class ControladorUsuarioEditar extends HttpServlet {


    Empleados empleado = new Empleados();
    EmpleadosDao empleadoDao = new EmpleadosDao();
    Usuarios usuario = new Usuarios();
    UsuariosDao usuariosDao = new UsuariosDao();
            
    int id;
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            String menu = request.getParameter("menu");
            String accion = request.getParameter("accion");
            if(menu.equals("UsuariosEditar")){
                switch(accion){
                    case "Editar":
                        List listaEmpleado= empleadoDao.listar();
                        request.setAttribute("listaEmpleado", listaEmpleado);
                        id = Integer.parseInt(request.getParameter("id"));
                        Usuarios usuarios = usuariosDao.Seleccionar(id);
                        request.setAttribute("listaUsuarios", usuarios);
                    break;
                    case "Actualizar":
                        String Empleado  = request.getParameter("txtEmpelado");
                        String Usuario  = request.getParameter("txtUsuario");
                        String Clave  = request.getParameter("txtClave");
                        usuario.setIdEmpleado(Integer.parseInt(Empleado));
                        usuario.setUsuario(Usuario);
                        usuario.setClave(Clave);
                        usuario.setId(id);
                        boolean editar = usuariosDao.Editar(usuario);
                        if(editar){
                            request.setAttribute("MensajeConfirmacion", "Registro Actualizado");
                        }else{
                            request.setAttribute("MensajeError", "Error");
                        }
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionBasica/Usuarios/Componentes/Page/EditarUsuarios/EditarUsuarios.jsp").forward(request, response);
            }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
