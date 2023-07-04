/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Autos;
import Modelo.Empleados;
import Modelo.Empresas;
import Modelo.TipoEmpleado;
import ModeloDao.ApiDNIRUC;
import ModeloDao.AutosDao;
import ModeloDao.EmpleadosDao;
import ModeloDao.EmpresasDao;
import ModeloDao.TipoEmpleadoDao;
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
public class ControladorAutoEditar extends HttpServlet {

    
    Autos autos = new Autos();
    AutosDao autosDao = new AutosDao();
    Empresas empresas = new Empresas();
    EmpresasDao empresasDao = new EmpresasDao();
            
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
            if(menu.equals("AutoEditar")){
                switch(accion){
                    case "Editar":
                        List listaMarca= autosDao.listarMarca();
                        request.setAttribute("listaMarca", listaMarca);
                        List listaModelo= autosDao.listarModelo();
                        request.setAttribute("listaModelo", listaModelo);
                        List listaEmpresas = empresasDao.listar();
                        request.setAttribute("listaEmpresas", listaEmpresas);
                        id = Integer.parseInt(request.getParameter("id"));
                        Autos auto = autosDao.Seleccionar(id);
                        request.setAttribute("listaAuto", auto);
                    break;
                    case "Actualizar":
                        String matricula = request.getParameter("txtMatricula");
                        String marca = request.getParameter("txtMarca");
                        String modelo = request.getParameter("txtModelo");
                        String empresa = request.getParameter("txtEmpresas");
                        String generacion = request.getParameter("txtGeneracion");
                        autos.setMatricula(matricula);
                        autos.setIdMarca(Integer.parseInt(marca));
                        autos.setIdModelo(Integer.parseInt(modelo));
                        autos.setIdEmpresa(Integer.parseInt(empresa));
                        autos.setGeneracion(generacion);
                        autos.setId(id);
                        boolean editar = autosDao.Editar(autos);
                        if(editar){
                            request.setAttribute("MensajeConfirmacion", "Registro Actualizado");
                        }else{
                            request.setAttribute("MensajeError", "Error en Registro");
                        }
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Configuracion/ConfiguracionOtros/Autos/Componentes/Page/EditarAutos/EditarAutos.jsp").forward(request, response);
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
