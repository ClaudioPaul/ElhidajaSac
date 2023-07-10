/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Empresas;
import Modelo.Proveedores;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class ProveedoresDao {
    Conexion conexion;
    
    public ProveedoresDao(){
        conexion = new Conexion();
    }
    

    public List<Proveedores> listar() {
        ArrayList<Proveedores> listarProveedores =new ArrayList();
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
                listarProveedores.add(proveedores);
            }
        } catch (Exception e) {
            
        }
        return listarProveedores;
    }
    
    public boolean Eliminar(int IdProveedores) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EliminarProveedores(?)}");
            cs.setInt(1, IdProveedores);
            cs.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Proveedores> Buscar(String RazonSocial) {
        ArrayList<Proveedores> listarProveedores =new ArrayList();
        Proveedores proveedores;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call BuscarProveedores(?)}");
            cs.setString(1, RazonSocial);
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
                listarProveedores.add(proveedores);
            }
            
        } catch (Exception e) {
            
        }
        return listarProveedores;
    }
    
    public String ValidarRuc(String Ruc) {
        String Rucs = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call ValidarRucProveedores(?)}");
            cs.setString(1, Ruc);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
               Rucs = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return Rucs;
    }
    
    public String ValidarRucEstado(String Ruc) {
        String Rucs = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call ValidarRucEstadoProveedores(?)}");
            cs.setString(1, Ruc);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
               Rucs = rs.getString(1);
            }
        } catch (Exception e) {
        }
        return Rucs;
    }
    
    public boolean Activar(String ruc) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call ActivarProveedores(?)}");
            cs.setString(1, ruc);
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean Registrar(Proveedores proveedor) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarProveedores(?,?,?,?,?,?)}");
            cs.setString(1, proveedor.getRuc());
            cs.setString(2, proveedor.getRazonSocial());
            cs.setString(3, proveedor.getNombreRepresentante());
            cs.setString(4, proveedor.getApellidoRepresentante());
            cs.setString(5, proveedor.getDireccion());
            cs.setString(6, proveedor.getContacto());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public Proveedores Seleccionar(int Idproveedores) {
        Proveedores proveedores = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarProveedores(?)}");
            cs.setInt(1, Idproveedores);
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
            }
        } catch (Exception e) {
        }
        return proveedores;
    }
    
    public boolean Editar(Proveedores proveedores) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarProveedores(?,?,?,?,?)}");
            cs.setString(1, proveedores.getNombreRepresentante());
            cs.setString(2, proveedores.getApellidoRepresentante());
            cs.setString(3, proveedores.getDireccion());
            cs.setString(4, proveedores.getContacto());
            cs.setInt(5, proveedores.getId());
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
}
