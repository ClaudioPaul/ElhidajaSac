 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.Materiales;
import Modelo.Proveedores;
import ModeloDao.ComprasDao;
import ModeloDao.DetalleComprasDao;
import ModeloDao.MaterialesDao;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;



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
    int listaCompraId;
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
                    String IdProveedor = request.getParameter("txtProveedor");
                    String Fecha = request.getParameter("txtFecha");
                    String serie = request.getParameter("txtSerie");
                    String Correlativo = request.getParameter("txtCorrelativo");
                    String Total = request.getParameter("txtTotal");

                    compras.setIdProveedores(Integer.parseInt(IdProveedor));
                    compras.setFecha(Fecha);
                    compras.setSerie(serie);
                    compras.setCorrelativo(Integer.parseInt(Correlativo));
                    compras.setTotal(Double.parseDouble(Total));

                    boolean registroExitoso = comprasDao.Registrar(compras);

                    if(registroExitoso){
                        int IdCompra = comprasDao.listarCompras();
                        
                        String tablaComprasJson = request.getParameter("tablaCompras");
                        List<Map<String, String>> tablaCompras = new ArrayList<>();

                        if (tablaComprasJson != null) {
                            tablaCompras = new Gson().fromJson(tablaComprasJson, 
                                    new TypeToken<List<Map<String, String>>>() {}.getType());
                        }

                        // Acceder a los datos de cada fila de la tabla
                        for (Map<String, String> fila : tablaCompras) {
                            String idMateriales = fila.get("id");
                            String cantidad = fila.get("cantidad");
                            String precio = fila.get("precio");
                            String subtotal = fila.get("subtotal");
                            
                            detalleCompra = new DetalleCompra();
                            detalleCompra.setIdMateriales(Integer.parseInt(idMateriales));
                            detalleCompra.setIdCompras(IdCompra);
                            detalleCompra.setCatidad(Integer.parseInt(cantidad));
                            detalleCompra.setPrecio(Double.parseDouble(precio));
                            detalleCompra.setSubtotal(Double.parseDouble(subtotal));
                            
                            boolean RegistroDetalle = detalleComprasDao.Registrar(detalleCompra);
                            
                            boolean AumentarStock = detalleComprasDao.Editar(detalleCompra.getCatidad(), 
                                    detalleCompra.getIdMateriales());
                            
                            
                            if(RegistroDetalle =! true) {
                                request.setAttribute("MensajeError", "Error en Registro");
                            }
                        }
                                request.setAttribute("MensajeConfirmacion", "Registrado");
                                
                    } else {
                        request.setAttribute("MensajeError", "Error en Registro");
                    }

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
