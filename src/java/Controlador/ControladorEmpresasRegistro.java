/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.ApiReniecSunat;
import Modelo.Empresas;
import Modelo.TipoEmpleado;
import ModeloDao.ApiDNIRUC;
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
public class ControladorEmpresasRegistro extends HttpServlet {

    
    ApiDNIRUC apiD = new ApiDNIRUC();
    Empresas empresas = new Empresas();
    EmpresasDao empresasDao = new EmpresasDao();
    TipoEmpleado tipo = new TipoEmpleado();
    TipoEmpleadoDao tipoDao = new TipoEmpleadoDao();
            
    int idEmpresa;
    String BuscarRUC;
    String Rucs;
    String ValidarRuc;
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
                    //Codigo para validar si existe un registro en la base de datos
                    ValidarRuc  = request.getParameter("txtBuscarRuc");
                    Rucs = empresasDao.ValidarRuc(ValidarRuc);
                    if(Rucs == null){
                        Rucs = empresasDao.ValidarRucEstado(ValidarRuc);
                        if(Rucs != null){
                                request.setAttribute("MensajeErrorEstado", "Ya existe esta empresa en tu base de Datos pero está Inhabilitada"
                                        + " ¿Desea Habilitar la Empresa?");
                        }else{
                            // Buscar Ruc en SUNAT
                            BuscarRUC = request.getParameter("txtBuscarRuc");
                            ApiReniecSunat api = apiD.ConsultarRUC(BuscarRUC);
                            if(BuscarRUC.length() != 11){
                                    request.setAttribute("MensajeErrorBuscar", "Recuerda que un número Ruc tiene 11 dígitos");
                            }else{
                                if (api != null) {
                                    request.setAttribute("Api", api);
                                } else {
                                    request.setAttribute("MensajeErrorBuscar", "No se encontró Resutados");
                                }
                            }
                        }
                    }else{
                            request.setAttribute("MensajeErrorBuscar", "Ya existe esta empresa en tu base de Datos");
                    }
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
                            boolean registro = empresasDao.Registrar(empresas);
                            if(registro){
                                request.setAttribute("MensajeConfirmacion", "Regitrado");
                            }else{
                                request.setAttribute("MensajeError", "Error en Registro");
                            }
                    break;
                    case "Activar":
                        boolean activar = empresasDao.Activar(ValidarRuc);
                        if(activar){
                            request.setAttribute("MensajeConfirmacion", "Empresa Habilitada");
                        }else{
                            request.setAttribute("MensajeError", "Error en Activar");
                        }
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
