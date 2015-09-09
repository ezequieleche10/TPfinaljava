package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import modelos.Auto;
import modelos.Marca;
import modelos.Usuario;
import negocio.ControladorAuto;
import negocio.ControladorMarca;


/**
 * Servlet implementation class ServletSeleccionaAuto
 */
@WebServlet("/ServletFiltraxPrecio")
public class ServletFiltraxPrecio extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletFiltraxPrecio() {
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
		HttpSession session=request.getSession();
		String user = request.getParameter("usuario");
		
		
		float precio_minimo = Float.parseFloat(request.getParameter("ValueMin").toString());
		float precio_maximo = Float.parseFloat(request.getParameter("ValueMax").toString());
				
		try{
		
		session.setAttribute("precio_minimo",precio_minimo);
		session.setAttribute("precio_maximo",precio_maximo);
		session.setAttribute("usuario", user);
		
		request.getRequestDispatcher("/inicioxPrecio.jsp").forward(request, response);
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorFiltro.html"); //No está creada esta vista1.
		}
		// TODO Auto-generated method stub
	}

		
		
	}


