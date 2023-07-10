/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Empresas;
import Modelo.Materiales;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class MaterialesDao {
    Conexion conexion;
    
    public MaterialesDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Materiales materiales) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarMateriales(?,?,?)}");
            cs.setString(1, materiales.getNombre());
            cs.setString(2, materiales.getDescripcion());
            cs.setDouble(3, materiales.getPrecio());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Materiales> listar() {
        ArrayList<Materiales> listarMateriales =new ArrayList();
        Materiales materiales;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call mostrarMateriales}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                materiales = new Materiales();
                materiales.setId(rs.getInt(1));
                materiales.setNombre(rs.getString(2));
                materiales.setDescripcion(rs.getString(3));
                materiales.setPrecio(rs.getDouble(4));
                materiales.setStock(rs.getInt(5));
                listarMateriales.add(materiales);
            }
        } catch (Exception e) {
            
        }
        return listarMateriales;
    }
    
    public Materiales Seleccionar(int IdMateriales) {
        Materiales materiales = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarMateriales(?)}");
            cs.setInt(1, IdMateriales);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                materiales = new Materiales();
                materiales.setId(rs.getInt(1));
                materiales.setNombre(rs.getString(2));
                materiales.setDescripcion(rs.getString(3));
                materiales.setPrecio(rs.getDouble(4));
                materiales.setStock(rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return materiales;
    }
    
    public boolean Editar(Materiales materiales) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarMateriales(?,?,?,?)}");
            cs.setString(1, materiales.getNombre());
            cs.setString(2, materiales.getDescripcion());
            cs.setDouble(3, materiales.getPrecio());
            cs.setInt(4, materiales.getId());
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean Eliminar(int IdEmpresas) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EliminarMateriales(?)}");
            cs.setInt(1, IdEmpresas);
            cs.executeUpdate();
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Materiales> Buscar(String Nombre) {
        ArrayList<Materiales> listarMateriales =new ArrayList();
        Materiales materiales;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call BuscarMateriales(?)}");
            cs.setString(1, Nombre);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                materiales = new Materiales();
                materiales.setId(rs.getInt(1));
                materiales.setNombre(rs.getString(2));
                materiales.setDescripcion(rs.getString(3));
                materiales.setPrecio(rs.getDouble(4));
                materiales.setStock(rs.getInt(5));
                listarMateriales.add(materiales);
            }
            
        } catch (Exception e) {
            
        }
        return listarMateriales;
    }
}
