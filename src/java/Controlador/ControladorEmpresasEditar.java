/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empresas;
import ModeloDao.ApiDNIRUC;
import ModeloDao.EmpresasDao;
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
public class ControladorEmpresasEditar extends HttpServlet {

    
    ApiDNIRUC apiD = new ApiDNIRUC();
    Empresas empresas = new Empresas();
    EmpresasDao empresasDao = new EmpresasDao();
            
    int idEmpresa;
    String BuscarRUC;
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
            if(menu.equals("EmpresasEditar")){
                switch(accion){
                    case "Editar":
                        idEmpresa = Integer.parseInt(request.getParameter("id"));
                        Empresas empresa = empresasDao.Seleccionar(idEmpresa);
                        request.setAttribute("listaEmpresa", empresa);
                    break;
                    case "Actualizar":
                        String Rucs  = request.getParameter("txtRuc");
                        String RasonSocials  = request.getParameter("txtRazonsocial");
                        String Direccions  = request.getParameter("txtDireccion");
                        String NombreRepresentantes  = request.getParameter("txtNombre");
                        String ApellidoRepresentantes  = request.getParameter("txtApellidos");
                        String Telefonos  = request.getParameter("txtTelefono");
                        String Correos  = request.getParameter("txtCorreo");
                        empresas.setRuc(Rucs);
                        empresas.setRazonSocial(RasonSocials);
                        empresas.setDireccion(Direccions);
                        empresas.setNombreRepresentante(NombreRepresentantes);
                        empresas.setApellidoRepresentante(ApellidoRepresentantes);
                        empresas.setTelefono(Telefonos);
                        empresas.setCorreo(Correos);
                        empresas.setId(idEmpresa);
                        empresasDao.Editar(empresas);
                        request.getRequestDispatcher("ControladorEmpresas?menu=Empresas&accion=Listar").forward(request, response);
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/EditarClientes/EditarClientes.jsp").forward(request, response);
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
