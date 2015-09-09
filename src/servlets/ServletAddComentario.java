package servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelos.Auto;
import modelos.Comentario;
import negocio.ControladorAuto;
import negocio.ControladorComentario;

@WebServlet("/ServletAddComentario")

public class ServletAddComentario {

private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAddComentario() {
        
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
		HttpSession session=request.getSession();
		Comentario nuevoComentario = new Comentario();
		nuevoComentario.setCod_auto(Integer.parseInt(request.getParameter("cod_auto")));
		nuevoComentario.setNom_usuario((String)(request.getParameter("cod_usuario")));
		java.util.Date fechaComentario = new Date();
		java.sql.Date fechaSQL = new java.sql.Date(fechaComentario.getTime());
		nuevoComentario.setFecha_public((fechaSQL));
		nuevoComentario.setComentario(request.getParameter("comment"));
		nuevoComentario.setVoto(Integer.parseInt(request.getParameter("radio")));
				
		try{
		ControladorComentario.AddComentario(nuevoComentario);
		response.sendRedirect("/selectOne.jsp");/*Redirige al Auto seleccionado con el comentario nuevo*/
		}
		catch(Exception e)
		{
			response.sendRedirect("/ErrorComentario.html"); //No está creada esta vista1.
		}
		// TODO Auto-generated method stub
	}

	
}
