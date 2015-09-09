package modelos;

public class Usuario {

	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getCod_rol() {
		return cod_rol;
	}

	public void setCod_rol(int cod_rol) {
		this.cod_rol = cod_rol;
	}

	public String getDescrip_rol() {
		return descrip_rol;
	}

	public void setDescrip_rol(String descrip_rol) {
		this.descrip_rol = descrip_rol;
	}

	private String nombre;
	
	private String apellido;
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	private String username;
	
	private int cod_rol;

	private String password;
	
	private String descrip_rol;
}
