package modelos;

import java.sql.Date;

public class Comentario {
	
	private int cod_auto;

	public int getCod_auto() {
		return cod_auto;
	}

	public void setCod_auto(int cod_auto) {
		this.cod_auto = cod_auto;
	}
	
	private String nom_usuario;

	public String getNom_usuario() {
		return nom_usuario;
	}

	public void setNom_usuario(String cod_usuario) {
		this.nom_usuario = cod_usuario;
	}
	
	private Date fecha_public;

	public Date getFecha_public() {
		return fecha_public;
	}

	public void setFecha_public(Date fecha_public) {
		this.fecha_public = fecha_public;
	}
	
	private String comentario;

	public String getComentario() {
		return comentario;
	}

	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	private int voto;
	
	public int getVoto(){
	 return voto;
	}
	public void setVoto(int voto){
	 this.voto=voto;	
	}
}
