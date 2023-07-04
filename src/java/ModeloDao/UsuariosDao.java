/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Usuarios;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author CLAUDIO CRUZADO
 */
public class UsuariosDao {
    Conexion conexion;
    
    public UsuariosDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Usuarios usuarios) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistrarUsuarios(?,?,?)}");
            cs.setInt(1, usuarios.getIdEmpleado());
            cs.setString(2, usuarios.getUsuario());
            cs.setString(3, usuarios.getClave());

            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
    public List<Usuarios> listar() {
        ArrayList<Usuarios> listaUsuarios =new ArrayList();
        Usuarios usuarios;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call MostrarUsuarios}");
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                usuarios = new Usuarios();
                usuarios.setId(rs.getInt(1));
                usuarios.setIdEmpleado(rs.getInt(2));
                String Nombre = rs.getString(3);
                String Apellidos = rs.getString(4);
                usuarios.setEmpleado(Nombre + " " + Apellidos);
                usuarios.setUsuario(rs.getString(5));
                usuarios.setClave(rs.getString(6));
                listaUsuarios.add(usuarios);
            }
        } catch (Exception e) {
            
        }
        return listaUsuarios;
    }
    
    public Usuarios Seleccionar(int IdUsuarios) {
        Usuarios usuarios = null;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call SeleccionarUsuarios(?)}");
            cs.setInt(1, IdUsuarios);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                usuarios = new Usuarios();
                usuarios.setId(rs.getInt(1));
                usuarios.setIdEmpleado(rs.getInt(2));
                String Nombre = rs.getString(3);
                String Apellidos = rs.getString(4);
                usuarios.setEmpleado(Nombre + " " + Apellidos);
                usuarios.setUsuario(rs.getString(5));
                usuarios.setClave(rs.getString(6));
            }
        } catch (Exception e) {
        }
        return usuarios;
    }
    
    public boolean Editar(Usuarios usuarios) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call EditarUsuarios(?,?,?,?)}");
            cs.setInt(1, usuarios.getIdEmpleado());
            cs.setString(2, usuarios.getUsuario());
            cs.setString(3, usuarios.getClave());
            cs.setInt(4, usuarios.getId());
            
            int numFAfectadas = cs.executeUpdate();

            if(numFAfectadas>0){
                return true;
            }
        } catch (Exception e) {
        }
        return false;
    }
    
//    public boolean Eliminar(int IdEmpresas) {
//        try {
//            Connection accesoBD = conexion.getConexion();
//            CallableStatement cs = accesoBD.prepareCall("{ call EliminarEmpresas(?)}");
//            cs.setInt(1, IdEmpresas);
//            cs.executeUpdate();
//        } catch (Exception e) {
//        }
//        return false;
//    }
//    
    public List<Usuarios> Buscar(String Nombre) {
        ArrayList<Usuarios> listaUsuarios =new ArrayList();
        Usuarios usuarios;
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{ call BuscarEmpresas(?)}");
            cs.setString(1, Nombre);
            ResultSet rs = cs.executeQuery();
            while(rs.next()){
                 usuarios = new Usuarios();
                usuarios.setId(rs.getInt(1));
                usuarios.setIdEmpleado(rs.getInt(2));
                String Nombres = rs.getString(3);
                String Apellidos = rs.getString(4);
                usuarios.setEmpleado(Nombres + " " + Apellidos);
                usuarios.setUsuario(rs.getString(5));
                usuarios.setClave(rs.getString(6));
                listaUsuarios.add(usuarios);
            }
            
        } catch (Exception e) {
            
        }
        return listaUsuarios;
    }
}
