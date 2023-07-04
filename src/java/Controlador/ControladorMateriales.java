/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empresas;
import Modelo.Materiales;
import ModeloDao.ApiDNIRUC;
import ModeloDao.EmpresasDao;
import ModeloDao.MaterialesDao;
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
public class ControladorMateriales extends HttpServlet {

    
    Materiales materiales = new Materiales();
    MaterialesDao materialesDao = new MaterialesDao();
            
    int id;
    String BuscarMateriales;
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
            if(menu.equals("Materiales")){
                switch(accion){
                    case "Listar":
                        List lista = materialesDao.listar();
                        request.setAttribute("listaMateriales", lista);
                    break;
                    case "Eliminar":
                        id = Integer.parseInt(request.getParameter("id"));
                        materialesDao.Eliminar(id);
                        request.getRequestDispatcher("ControladorMateriales?menu=Materiales&accion=Listar").forward(request, response);
                    break;
//                    case "Buscar":
//                        BuscarEmpresas =request.getParameter("txtBuscar");
//                        List listas = empresasDao.Buscar(BuscarEmpresas);
//                        if(listas.isEmpty()){
//                            request.setAttribute("mensaje", "No se encontraron datos");
//                        }else{
//                            request.setAttribute("listaEmpresas", listas);
//                        }
//                    break;
//                    case "Cancelar":
//                        request.getRequestDispatcher("ControladorEmpresas?menu=Empresas&accion=Listar").forward(request, response);
//                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionArticulos/Materiales/Componentes/Page/MostrarMateriales/MostrarMateriales.jsp").forward(request, response);
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
