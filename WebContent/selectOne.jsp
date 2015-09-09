<%@page import="modelos.Usuario"%>
<%@page import="negocio.ControladorUsuario"%>
<%@page import="datos.CatalogoComentario"%>
<%@page import="modelos.Comentario"%>
<%@page import="java.awt.Window"%>
<%@page import="javax.xml.stream.events.Comment"%>

<%@page import="negocio.ControladorComentario"%>
<%@page import="negocio.ControladorAuto"%>
<%@page import="modelos.Auto"%>
<%@page import="java.util.ArrayList"%>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Rosario Intercambia</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-item.css" rel="stylesheet">
    <link href="css/calificacion.css" rel="stylesheet">
    
    

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
    
</head>

<body>

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="inicio.jsp">Coment@utos</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                   
                </ul>
                <div class="pull-right">
                    <% 
    String currentusuario =""; 
    
	try{ 
    if(session.getAttribute("usuario") != null){
        currentusuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
     	
%>
<br>
                   <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=currentusuario %><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="ServletLogOut">Logout</a></li>
      		
          </ul>
        </li>
<%  }
    else
    { 
%>    	
					<a class="navbar-brand" href="nuevologin.jsp">Login</a>
					<a class="navbar-brand" href="SignUp.jsp">Registrarse</a>
<% 
    }
    }catch(NullPointerException ex){} 
%>                    
                </div>  <!-- /del pull right -->
                
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
    
    <% 
    Auto AutoSel = new Auto();
    AutoSel = ControladorAuto.getOne(Integer.parseInt(request.getParameter("cod_auto")));
    ArrayList<Comentario> comentario = new ArrayList<Comentario>();                
    comentario= ControladorComentario.getAll(AutoSel.getCod_auto());                
    
    String usuario ="";                        
   // session.setAttribute("usuario", "Martin");
    if(session.getAttribute("usuario") != null){
        usuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
    }
    else
    {	
    //	response.sendRedirect("/inicio.jsp");
    //	throw new Exception("Usuario no logeado");
    }
    %>
    
    

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-3">
            
                
            </div>

            <div class="col-md-9">

                <div class="thumbnail">
                    <img class="img-responsive" src="img/<%=AutoSel.getImagen()%>" alt="">
                    <div class="caption-full">
                        <h4 class="pull-right">U$D <%=AutoSel.getPrecio() %></h4>
                        <p><%=AutoSel.getNombre_auto()%></p>
                        <p><%=AutoSel.getDescripcionAuto() %></p>
                        
                        </div>
                    <div class="ratings">
                        <p class="pull-right"><%=ControladorComentario.getAll(AutoSel.getCod_auto()).size()%>Comentarios</p>
                        <% int Valoracion = AutoSel.getValoracion();
                                    for(int j=0; j<Valoracion;j++){ %>
                                   <span class="glyphicon glyphicon-star"></span>
                                	   			<%} %>
                                   <%for(int m=0;m<(5-Valoracion);m++){ %>
                                	<span class="glyphicon glyphicon-star-empty"></span>
                                	<%} %>
                    </div>
                </div>

                <div class="well">
	
					<% if (session.getAttribute("cod_rol") != null){
					if(Integer.parseInt(session.getAttribute("cod_rol").toString())==1){ %>
                    <div class="text-right">
                        
                       <button type="button" class="btn btn-info btn-lg" onclick="setModalComentario(<%=AutoSel.getCod_auto()%>)" 
                       data-toggle="modal" data-target="#myModal">Deja tu Comentario</button>
                       
                    <% 
                    } else if(Integer.parseInt(session.getAttribute("cod_rol").toString())==2){%>
                    	<div class="text-right">
                    	  	<button type="button" class="btn btn-info btn-lg" onclick="setModalComentario(<%=AutoSel.getCod_auto()%>)"
                    	  	 data-toggle="modal" data-target="#myModalModific">Editar</button>
                   		    <button type="button" class="btn btn-info btn-lg" onclick="setModalComentario(<%=AutoSel.getCod_auto()%>)" 
                   		    data-toggle="modal" data-target="#myModalEliminar">Eliminar</button>              		
                   <% }}else 
                	   {%>
                	   <div class="text-right">
               	  	<a class="btn btn-info btn-lg" href="nuevologin.jsp">Logueate para comentar</a>
                	  <% } %>
                	   
                    </div>

 <!-- Modal Comentar -->


<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Tu comentario</h4>
        </div>
        <div class="modal-body">
		<form id="comentario">
		<input id="cod_auto" name="cod_auto" hidden />      
        <div class="form-group">
      
      <label for="comment">Comentar:</label>
      <textarea class="form-control" rows="5" id="comment" name ="comment"></textarea>
		  </div>
		   <div>
		   
		   <strong class="choice" ></strong>
		   <span class="star-rating">
 			 <input type="radio" name="rating"  value="1" checked><i></i>
 			 <input type="radio" name="rating"  value="2"><i></i>
 			 <input type="radio" name="rating"  value="3"><i></i>
 			 <input type="radio" name="rating"  value="4"><i></i>
 			 <input type="radio" name="rating"  value="5"><i></i>
			</span>
			<input type="hidden" id="votacion" value="1"/>
		  
      		
		</div>
         </form> 
        </div>
       <div class="modal-footer">
         
          <button id ="btnComment" type="button" onclick="comentar()" class="btn btn-primary" data-dismiss="modal" >Comentar</button>
        </div>
       
      </div>
    </div>
  </div>
  		     <hr>
                    <%for(int i=0; i<comentario.size();i++){ %>
			        <div class="row">
                        <div class="col-md-12">
                            <%int ValoracionCom = comentario.get(i).getVoto();
                                    for(int j=0; j<ValoracionCom;j++){ %>
                                   <span class="glyphicon glyphicon-star"></span>
                                	   			<%} %>
                                   <%for(int m=0;m<(5-ValoracionCom);m++){ %>
                                	<span class="glyphicon glyphicon-star-empty"></span>
                                	<% }%>
                            
                            <span class="pull-right"><a><%=comentario.get(i).getNom_usuario()%>  //  <%=comentario.get(i).getFecha_public()%></a></span>
                            <p>Comentario:<%=comentario.get(i).getComentario() %></p>
                        </div>
                    </div>
			
                    <hr>
					<% } %>
                    </div>

            </div>

        </div>

    </div>
    
<!-- Modal Modificar -->


<div class="modal fade" id="myModalModific" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modificar</h4>
        </div>
        <div class="modal-body">
		<form id="comentario">
		<input id="cod_auto" name="cod_auto" hidden />      
        <div class="form-group">
      
      <label for="Descripcion">Descripcion:</label>
      <textarea class="form-control" rows="2" id="descripcion" name ="descripcion" required="" autofocus="" onblur="validaDes();"></textarea>
	  <label for="precio">Precio:</label>
      <input class="form-control" id="precio" name ="precio" onkeypress="return justNumbers(event);" required="" onblur="validaPre();">
		  
		  </div>
		   
         </form> 
        </div>
       <div class="modal-footer">
         
          <button id ="btnModific" type="button" onclick="modificar()" class="btn btn-primary" data-dismiss="modal" >Modificar</button>
        </div>
       
      </div>
    </div>
  </div>
  	
  	<!-- Modal Eliminar -->


<div class="modal fade" id="myModalEliminar" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Elimina el auto seleccionado</h4>
        </div>
        <div class="modal-body">
		<form id="comentario">
		<input id="cod_auto" name="cod_auto" hidden />      
        <div class="form-group">
      
      <label for="EliminaAuto">¿Esta seguro que desea eliminar el auto seleccionado??</label>
        </div>
		   
         </form> 
        </div>
       <div class="modal-footer">
         
          <button id ="btnConfirma" type="button" onclick="eliminar()" class="btn btn-primary" data-dismiss="modal" >Confirmar</button>
          <button id ="btnCancela" type="button" onclick="this.close()" class="btn btn-primary" data-dismiss="modal" >Cancelar</button>
        </div>
       
      </div>
    </div>
  </div>
  		         
    
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright © Your Website 2014</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
    
<script>
$(':radio').change(
		  function(){
		
		//$('.choice').text( this.value);
		 document.getElementById('votacion').value=this.value;  	
		  } 
		)
</script>
<script type="text/javascript">
function comentar()
{
	
  
	var ruta= "GuardaComentario.jsp";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: "comment="+comment.value+"&cod_auto="+cod_auto.value+"&rating="+votacion.value,
			success: function(datos)
			{ 
				if(datos!="")
					{
					
					window.location.reload();
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			}
		
	});

}
function setModalComentario(codigoAuto)
{
	cod_auto.value = codigoAuto;
	}


</script>
<script type="text/javascript">
function modificar()
{
	
  
	var ruta= "ModificaAuto.jsp";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: "descripcion="+descripcion.value+"&cod_auto="+cod_auto.value+"&precio="+precio.value,
			success: function(datos)
			{ 
				if(datos!="")
					{
					
					window.location.reload();
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			}
		
	});

}
function setModalComentario(codigoAuto)
{
	cod_auto.value = codigoAuto;
	}


</script>
<script type="text/javascript">
function justNumbers(e)
{
var keynum = window.event ? window.event.keyCode : e.which;
if ((keynum == 8) || (keynum == 46))
return true;
 
return /\d/.test(String.fromCharCode(keynum));
} </script>
<script type="text/javascript">
function eliminar()
{
	
  
	var ruta= "EliminaAuto.jsp";
	$.ajax({
			async: false,
			url: ruta,
			type: "POST",
			data: "cod_auto="+cod_auto.value,
			success: function(datos)
			{ 
				if(datos!="")
					{
					
					
					document.location.href='inicio.jsp';
					}
				else
					{
					alert("Ha ocurrido un error, reintente");
					}
				
			}
		
	});

}
function setModalComentario(codigoAuto)
{
	cod_auto.value = codigoAuto;
	}


</script>


<script type="text/javascript">
function validaDes()
{
if( descripcion.value =="" )
{
alert("La descripcion debe tener un valor");
descripcion.focus();
btnModific.disable=true;
return false;
}
else
{ btnModific.disable=false;
return true; }
}

</script>

<script type="text/javascript">
function validaPre()
{
if(precio.value == "")
{
alert("El precio debe tener un valor");
precio.focus();
btnModific.disable=true;
return false;
}
else
{btnModific.disable=false;
return true; }
}

</script>


</body></html>