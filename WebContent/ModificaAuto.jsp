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

		HttpSession sesion=request.getSession();
		Auto AutoAMod = ControladorAuto.getOne(Integer.parseInt(request.getParameter("cod_auto"))); 
		AutoAMod.setDescripcionAuto((String)request.getParameter("descripcion"));
		AutoAMod.setPrecio(Float.parseFloat(request.getParameter("precio").toString()));
			
		try{
		ControladorAuto.UpdateAuto(AutoAMod.getCod_auto(), AutoAMod.getDescripcionAuto(), AutoAMod.getPrecio());
		out.println("OK");
		}
		catch(Exception e)
		{
			out.println("");
		}
		
	%>