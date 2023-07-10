/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empresas;
import Modelo.Proveedores;
import ModeloDao.ApiDNIRUC;
import ModeloDao.EmpresasDao;
import ModeloDao.ProveedoresDao;
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
public class ControladorProveedores extends HttpServlet {

    
    ApiDNIRUC apiD = new ApiDNIRUC();
    Proveedores proveedores = new Proveedores();
    ProveedoresDao proveedoresDao = new ProveedoresDao();
            
    int id;
    String BuscarProveedores;
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
            if(menu.equals("Proveedores")){
                switch(accion){
                    case "Listar":
                        List lista = proveedoresDao.listar();
                        request.setAttribute("listaProveedores", lista);
                    break;
                    case "Eliminar":
                        id = Integer.parseInt(request.getParameter("id"));
                        proveedoresDao.Eliminar(id);
                        request.getRequestDispatcher("ControladorProveedores?menu=Proveedores&accion=Listar").forward(request, response);
                    break;
                    case "Buscar":
                        BuscarProveedores = request.getParameter("txtBuscar");
                        List listas = proveedoresDao.Buscar(BuscarProveedores);
                        if(listas.isEmpty()){
                            request.setAttribute("mensaje", "No se encontraron datos");
                        }else{
                            request.setAttribute("listaProveedores", listas);
                        }
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionOtros/Proveedores/Componentes/Page/MostrarProveedores/MostrarProveedores.jsp").forward(request, response);
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
