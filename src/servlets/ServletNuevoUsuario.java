package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelos.Usuario;
import negocio.ControladorUsuario;

/**
 * Servlet implementation class ServletNuevoUsuario
 */
@WebServlet("/ServletNuevoUsuario")
public class ServletNuevoUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletNuevoUsuario() {
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
		
		HttpSession session= request.getSession(true);
	    
		String vUsername =request.getParameter("inputUsername");
	    
		String vPassword =request.getParameter("inputPassword");
		
		String vRePassword =request.getParameter("inputREPassword");
		
		String vNombre = request.getParameter("inputNombre");
		
		String vApellido = request.getParameter("inputApellido");
		
		try{
			Usuario User = new Usuario();
			User.setApellido(vApellido);
			User.setCod_rol(1);
			User.setNombre(vNombre);
			User.setPassword(vPassword);
			User.setUsername(vUsername);
			ControladorUsuario.AddUsuario(User);
			session.setAttribute("usuario", vUsername);
			request.getRequestDispatcher("inicio.jsp").forward(request, response);
		
		}catch(Exception e){
	    
		   session.setAttribute("error", e);
		   request.getRequestDispatcher("/SingUp.jsp").forward(request, response);
		 
		    
	    }
						
		}
		
		
	}


