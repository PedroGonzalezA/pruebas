package modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import conexion.Conexion;
import entidad.Usuario;

public class ModeloUsuario {	
	public Usuario iniciarSesion(String nombre, String clave) {
		Usuario usuario = null;
		Connection cn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		
		try {
			cn = Conexion.getConexion();
			String sql = "SELECT U.idUsuario, U.nombre, U.clave FROM usuario U WHERE U.nombre = ? AND U.clave = ?";
			pstm = cn.prepareStatement(sql);
			pstm.setString(1, nombre);
			pstm.setString(2, clave);
			rs = pstm.executeQuery();
			
			while (rs.next()) {
				usuario = new Usuario();
				usuario.setIdUsuario(rs.getInt("idUsuario"));
				usuario.setNombre(rs.getString("nombre"));
				usuario.setClave(rs.getString("clave"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				
				if (pstm != null) {
					pstm.close();
				}
				
				if (cn != null) {
					cn.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return usuario;
	}
}