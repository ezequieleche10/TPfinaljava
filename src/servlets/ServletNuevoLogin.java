package servlets;

import java.awt.Window;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JPanel;
import javax.swing.JViewport;

import negocio.ControladorUsuario;
import modelos.Usuario;

/**
 * Servlet implementation class ServletNuevoLogin
 */
@WebServlet("/ServletNuevoLogin")
public class ServletNuevoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNuevoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ControladorUsuario controlador = new ControladorUsuario();
		Usuario vUsuario;
		
		HttpSession session= request.getSession(true);
			    
		String vUsername =request.getParameter("inputUsername");
	    
		String vPassword =request.getParameter("inputPassword");
		
		try{
			if(ControladorUsuario.validarUsuario(vUsername, vPassword)== true)
			{
				
				Cookie cookieUsuario = new Cookie("cookieUsuario", vUsername);
	            cookieUsuario.setPath("/");
	            cookieUsuario.setMaxAge(60*60*24*31);
	            response.addCookie(cookieUsuario);
	            vUsuario = ControladorUsuario.getUsuario(vUsername);
		    	session.setAttribute("usuario",vUsername);
		    	session.setAttribute("controladorUsuario",controlador);
		    	session.setAttribute("cod_rol", vUsuario.getCod_rol());
		    	
		    	session.setAttribute("pass", vPassword);
		    	request.getRequestDispatcher("/inicio.jsp").forward(request, response);
			}
			else
	    	{
				
	    		throw new Exception("Ingreso incorrecto");
	    	}
	  	
	    }catch(Exception e){
	    
		   session.setAttribute("error", e);
		   request.getRequestDispatcher("/nuevologin.jsp").forward(request, response);
		 
		    
	    }
						
		}
		
			
			
	}



