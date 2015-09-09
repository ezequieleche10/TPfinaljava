<%@page import="negocio.ControladorUsuario"%>
<%
if(ControladorUsuario.existe(request.getParameter("inputUsername")))

	out.println(1);
else
	out.println(0);

%>