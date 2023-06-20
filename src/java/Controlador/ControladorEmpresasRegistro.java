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
public class ControladorEmpresasRegistro extends HttpServlet {

    
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
            if(menu.equals("EmpresasRegistro")){
                switch(accion){
                    case "Formilario":
                    break;
                    case "Buscar":
                        BuscarRUC = request.getParameter("txtBuscarRuc");
                        ApiReniecSunat api = apiD.ConsultarRUC(BuscarRUC);
                        request.setAttribute("Api", api);
                    break;
                    case "Agregar":
                        String Ruc  = request.getParameter("txtRuc");
                        String RasonSocial  = request.getParameter("txtRazonsocial");
                        String Direccion  = request.getParameter("txtDireccion");
                        String NombreRepresentante  = request.getParameter("txtNombre");
                        String ApellidoRepresentante  = request.getParameter("txtApellidos");
                        String Telefono  = request.getParameter("txtTelefono");
                        String Correo  = request.getParameter("txtCorreo");
                        empresas.setRuc(Ruc);
                        empresas.setRazonSocial(RasonSocial);
                        empresas.setDireccion(Direccion);
                        empresas.setNombreRepresentante(NombreRepresentante);
                        empresas.setApellidoRepresentante(ApellidoRepresentante);
                        empresas.setTelefono(Telefono);
                        empresas.setCorreo(Correo);
                        empresasDao.Registrar(empresas);
                        request.getRequestDispatcher("ControladorEmpresas?menu=Empresas&accion=Listar").forward(request, response);
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionOtros/Clientes/Componentes/Page/RegistroClientes/RegistroClientes.jsp").forward(request, response);
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
