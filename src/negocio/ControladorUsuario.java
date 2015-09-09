package negocio;

import java.util.ArrayList;

import javax.swing.JOptionPane; 

import datos.CatalogoMarca;
import datos.CatalogoUsuarios;
import modelos.Usuario;

public class ControladorUsuario {
	

static datos.CatalogoUsuarios catUsuarios;
static Usuario user = new Usuario();	


public ControladorUsuario(){
 
 catUsuarios =new datos.CatalogoUsuarios();

}


public static int AddUsuario(Usuario user)
{
	int idNuevoUsuario = CatalogoUsuarios.AddUsuario(user);
	
	return idNuevoUsuario;	
}

public static Usuario getUsuario(String pUsername)
{
	
	user =CatalogoUsuarios.GetOne(pUsername);
	
	return(user);	
	
	}
public static boolean existe(String pUsername)
	{
	  Usuario existUs = new Usuario();
	 existUs = CatalogoUsuarios.GetOne(pUsername);
	 if(existUs.getUsername()== null)
	 
		 return false;
	 	 else
		 return true;
	}



public static boolean validarUsuario(String pUsername, String pPassword)
{
	
	user = ControladorUsuario.getUsuario(pUsername);
	String nombreUsuario = user.getUsername();
	String contrasena = user.getPassword();
	if(nombreUsuario.equalsIgnoreCase(pUsername) && contrasena.equalsIgnoreCase(pPassword))
	{
		return true;
	}
	else
	{
		return false;
	}
}
}


