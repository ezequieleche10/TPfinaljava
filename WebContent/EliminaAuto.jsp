<%@page import="javax.servlet.ServletException"%>
<%@page import="javax.servlet.annotation.WebServlet"%>
<%@page import="javax.servlet.http.HttpServlet"%>
<%@page import="javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.servlet.http.HttpServletResponse"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@page import="modelos.Auto"%>
<%@page import="modelos.Comentario"%>
<%@page import="negocio.ControladorAuto"%>

<% 
// este archivo cumple una funcion similar a la de un servlet.
HttpSession Session=request.getSession();
try{

ControladorAuto.DeleteAuto(Integer.parseInt(request.getParameter("cod_auto")));
out.println("OK");
}
catch(Exception e)
{
	out.println("");
} 

%> 