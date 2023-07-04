/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Autos;
import Modelo.Compras;
import Modelo.DetalleCompra;
import Modelo.Empleados;
import Modelo.Marca;
import Modelo.Modelo;
import Modelo.Proveedores;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class DetalleComprasDao {
    Conexion conexion;
    
    public DetalleComprasDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(DetalleCompra detalleCompras) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarDetalleCompra(?,?,?,?,?)}");
            cs.setInt(1, detalleCompras.getIdMateriales());
            cs.setInt(2, detalleCompras.getIdCompras());
            cs.setInt(3, detalleCompras.getCatidad());
            cs.setDouble(4, detalleCompras.getPrecio());
            cs.setDouble(5, detalleCompras.getSubtotal());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Proveedores> listarProveedores() {
        ArrayList<Proveedores> listaProveedoreses =new ArrayList();
        Proveedores proveedores;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarProveedores}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                proveedores = new Proveedores();
                proveedores.setId(rs.getInt(1));
                proveedores.setRuc(rs.getString(2));
                proveedores.setRazonSocial(rs.getString(3));
                proveedores.setNombreRepresentante(rs.getString(4));
                proveedores.setApellidoRepresentante(rs.getString(5));
                proveedores.setDireccion(rs.getString(6));
                proveedores.setContacto(rs.getString(7));
                listaProveedoreses.add(proveedores);
            }
        } catch (Exception e) {
            
        }
        return listaProveedoreses;
    }
    
    public List<Compras> listarCompras() {
        ArrayList<Compras> listacompra =new ArrayList();
        Compras compra;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarCompras}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                compra = new Compras();
                compra.setId(rs.getInt(1));
                listacompra.add(compra);
            }
        } catch (Exception e) {
            
        }
        return listacompra;
    }
    public List<DetalleCompra> listar() {
        ArrayList<DetalleCompra> listaDetalle =new ArrayList();
        DetalleCompra detalleCompra;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarDetalleCompra}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                detalleCompra = new DetalleCompra();
                detalleCompra.setId(rs.getInt(1));
                detalleCompra.setMateriales(rs.getString(2));
                detalleCompra.setProveedores(rs.getString(3));
                detalleCompra.setFecha(rs.getDate(4));
                detalleCompra.setCatidad(rs.getInt(5));
                detalleCompra.setPrecio(rs.getDouble(6));
                detalleCompra.setSubtotal(rs.getDouble(7));
                detalleCompra.setTotal(rs.getDouble(8));
                detalleCompra.setIdCompras(rs.getInt(9));
                listaDetalle.add(detalleCompra);
            }
        } catch (Exception e) {
            
        }
        return listaDetalle;
    }
    
}
