package datos;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.jws.soap.SOAPBinding.Use;

import modelos.Marca;
import modelos.Usuario;

public class CatalogoUsuarios {




	public static Usuario GetOne(String pUsername)
	{
		
		Usuario userBD = new Usuario();
		try{
			
		 
		String SQLCons= "SELECT * FROM usuarios WHERE username=?";
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setString(1, pUsername);
		ResultSet rta = stmt.executeQuery();
		while(rta.next())
		{
						
						userBD.setUsername(rta.getString("username"));
						userBD.setPassword(rta.getString("password"));
						userBD.setCod_rol(Integer.parseInt(rta.getString("cod_rol")));
								}
					rta.close();
					stmt.close();
						
						
						} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						System.out.println("Error al recuperar Usuario");
						
								}
		return userBD;
	}
	
	public static int AddUsuario(Usuario User)
	{ //se cargan los autos
		try{
			
			 
		String SQLCons= "INSERT INTO usuarios (username, password, cod_rol, nombre_usuario, apellido_usuario) VALUES (?,?,?,?,?)"; 
	ConexionBD conecta = new ConexionBD();
	conecta.OpenConection();
	PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
	stmt.setString(1,User.getUsername());
	stmt.setString(2, User.getPassword());
	stmt.setInt(3,User.getCod_rol());
	stmt.setString(4, User.getNombre());
	stmt.setString(5, User.getApellido());
	
	stmt.execute();
	
	conecta.CloseConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
									}
			return Statement.RETURN_GENERATED_KEYS;
	}

	
	}


