
<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="modelos.Auto"%>
<%@page import="modelos.Comentario"%>
<%@page import="negocio.ControladorAuto"%>
<%@page import="negocio.ControladorComentario"%>
<% 
// este archivo cumple una funcion similar a la de un servlet.
String comentario = (String)request.getParameter("comment");
int votacion=Integer.parseInt(request.getParameter("rating"));
HttpSession Session=request.getSession();
Comentario nuevoComentario = new Comentario();
nuevoComentario.setCod_auto(Integer.parseInt(request.getParameter("cod_auto")));
nuevoComentario.setNom_usuario((String)(Session.getAttribute("usuario")));
nuevoComentario.setComentario(comentario);
nuevoComentario.setVoto(votacion);		
try{

ControladorComentario.AddComentario(nuevoComentario);
out.println("OK");
}
catch(Exception e)
{
	out.println("");
} 

%> 