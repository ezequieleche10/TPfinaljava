package datos;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import modelos.Comentario;

public class CatalogoComentario {
	private final static String CAMPOS = " cod_auto, nombreUsuario, fecha_public, comentario, voto";
	public static int AddComentario(Comentario newComentario)
	{
		try{
			//Agrega un comentario a la Tabla Comentarios 
		String SQLCons= "INSERT INTO comentario ("+CAMPOS+")"+ " VALUES (?,?,NOW(),?,?)";
	
	ConexionBD conecta = new ConexionBD();
	conecta.OpenConection();
	PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
	stmt.setInt(1,newComentario.getCod_auto());
	stmt.setString(2, newComentario.getNom_usuario());
	stmt.setString(3, newComentario.getComentario());
	stmt.setInt(4,newComentario.getVoto());
	
	stmt.execute();
	
	///Esto actualiza la valoracion del auto
	String SQLCons2="SELECT AVG(voto) as prom from comentario where ?=cod_auto";
	PreparedStatement stmt2= conecta.Cone.prepareStatement(SQLCons2);
	stmt2.setInt(1, newComentario.getCod_auto());
	ResultSet rta = stmt2.executeQuery();
	rta.first();
	Double prome=rta.getDouble("prom");
	int y = (int)Math.round(prome);
	
	String SQLCons3= "UPDATE auto SET valoracion=? WHERE ?=cod_auto";
	PreparedStatement stmt3=conecta.Cone.prepareStatement(SQLCons3);
	stmt3.setInt(1, y);
	stmt3.setInt(2, newComentario.getCod_auto());
	stmt3.execute();
	
	conecta.CloseConnection();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
					e.printStackTrace();
									}
			return Statement.RETURN_GENERATED_KEYS;
	}
	public static void DeleteComentario(int pCod_Auto, String pNom_Usuario, Date pFecha_public)
	{
		String SQLCons= "DELETE FROM comentario where (?= nombreUsuario AND ?=cod_usuario AND ?=fecha_public)";
		try {
			ConexionBD conecta = new ConexionBD();
			conecta.OpenConection();
			PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
			stmt.setInt(1, pCod_Auto);
			stmt.setString(1, pNom_Usuario);
			stmt.setDate(1, pFecha_public); 
			int rta = stmt.executeUpdate();
			
			
					} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
		}
	public static int UpdateComentario (Comentario ComentarioUPD)
	{
		String SQLCons= "UPDATE comentario SET comentario=? WHERE (?=cod_auto AND ?= nombreUsuario, ?=fecha_public)";
		try{
			
		ConexionBD conecta = new ConexionBD();
		conecta.OpenConection();
		PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
		stmt.setString(1, ComentarioUPD.getComentario());
		stmt.setInt(2, ComentarioUPD.getCod_auto());
		stmt.setString(3, ComentarioUPD.getNom_usuario());
		stmt.setDate(4, ComentarioUPD.getFecha_public());
		
		int rta = stmt.executeUpdate();
		}		
				 catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				return Statement.RETURN_GENERATED_KEYS;
	}


	public static ArrayList<Comentario> GetAll(int pCodAuto)
	{//Devuelve todos los comentarios sobre un Auto en particular
	ArrayList<Comentario> ComentariosAll = new ArrayList<Comentario>();
		
		try {
			String SQLCons= "Select "+CAMPOS+" FROM comentario WHERE cod_auto = ? ORDER BY fecha_public";
			ConexionBD conecta = new ConexionBD();
			conecta.OpenConection();
			PreparedStatement stmt = conecta.Cone.prepareStatement(SQLCons);
			stmt.setInt(1, pCodAuto);
			ResultSet rta = stmt.executeQuery();
			 	while(rta.next())
						{		Comentario comentarioDev = new Comentario();
					 			comentarioDev.setCod_auto(rta.getInt("cod_auto"));
								comentarioDev.setNom_usuario(rta.getString("nombreUsuario"));						
								comentarioDev.setFecha_public(rta.getDate("fecha_public"));
								comentarioDev.setComentario(rta.getString("comentario"));
								comentarioDev.setVoto(rta.getInt("voto"));
								ComentariosAll.add(comentarioDev);
								
				}
		}catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		return ComentariosAll;
	}

	
	
}
