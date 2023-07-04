 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Autos;
import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.Empleados;
import Modelo.Empresas;
import Modelo.Materiales;
import Modelo.Proveedores;
import Modelo.TipoEmpleado;
import ModeloDao.ApiDNIRUC;
import ModeloDao.AutosDao;
import ModeloDao.ComprasDao;
import ModeloDao.DetalleComprasDao;
import ModeloDao.EmpleadosDao;
import ModeloDao.EmpresasDao;
import ModeloDao.MaterialesDao;
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
public class ControladorCompraRegistro extends HttpServlet {

    
    Materiales materiales = new Materiales();
    MaterialesDao materialesDao = new MaterialesDao();
    Proveedores proveedores = new Proveedores();
    Compras compras = new Compras();
    ComprasDao comprasDao = new ComprasDao();
    DetalleCompra detalleCompra = new DetalleCompra();
    DetalleComprasDao detalleComprasDao = new DetalleComprasDao();
    
            
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
            if(menu.equals("CompraRegistro")){
                switch(accion){
                    case "Formulario":
                        List listaProveedores= comprasDao.listarProveedores();
                        request.setAttribute("listaproveedores", listaProveedores);
                        List listaMateriales = materialesDao.listar();
                        request.setAttribute("listaMateriales", listaMateriales);
                    break;
                    case "Agregar":
//                        String matricula = request.getParameter("txtMatricula");
//                        String marca = request.getParameter("txtMarca");
//                        String modelo = request.getParameter("txtModelo");
//                        String empresa = request.getParameter("txtEmpresas");
//                        String generacion = request.getParameter("txtGeneracion");
//                        autos.setMatricula(matricula);
//                        autos.setIdMarca(Integer.parseInt(marca));
//                        autos.setIdModelo(Integer.parseInt(modelo));
//                        autos.setIdEmpresa(Integer.parseInt(empresa));
//                        autos.setGeneracion(generacion);
//                        boolean registrar = autosDao.Registrar(autos);
//                        if(registrar){
//                            request.setAttribute("MensajeConfirmacion", "Registrado");
//                        }else{
//                            request.setAttribute("MensajeError", "Error en Registro");
//                        }
                    break;
                }
                request.getRequestDispatcher("Vista/Modules/Documentos/Compras/Componentes/Page/RegistroCompras/RegistroCompras.jsp").forward(request, response);
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
