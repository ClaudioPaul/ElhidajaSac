/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ModeloDao;

import Config.Conexion;
import Modelo.Autos;
import Modelo.Compras;
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
public class ComprasDao {
    Conexion conexion;
    
    public ComprasDao(){
        conexion = new Conexion();
    }
    
    public boolean Registrar(Compras compras) {
        try {
            Connection accesoBD = conexion.getConexion();
            CallableStatement cs = accesoBD.prepareCall("{call RegistraCompras(?,?,?,?,?)}");
            cs.setInt(1, compras.getIdProveedores());
            cs.setDate(2, new java.sql.Date(compras.getFecha().getTime()));
            cs.setString(3, compras.getSerie());
            cs.setInt(4, compras.getCorrelativo());
            cs.setDouble(5, compras.getTotal());
            cs.setBytes(6, compras.getArchivo()); // Utilizar setBytes() para un byte[]

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
}
