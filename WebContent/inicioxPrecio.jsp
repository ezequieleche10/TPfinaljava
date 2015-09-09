
<%@page import="modelos.Marca"%>
<%@page import="datos.CatalogoMarca"%>
<%@page import="datos.CatalogoAuto"%>
<%@page import="negocio.ControladorComentario"%>
<%@page import="negocio.ControladorAuto"%>
<%@page import="modelos.Auto"%>
<%@page import="java.util.ArrayList"%>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Martin Lopez Jordan">

    <title>Coment@utos Web</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/shop-homepage.css" rel="stylesheet">

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
     ArrayList<Auto> AutosAll = new ArrayList<Auto>();
                 		

float PrecioMin = Float.parseFloat(session.getAttribute("precio_minimo").toString());
float PrecioMax = Float.parseFloat(session.getAttribute("precio_maximo").toString());
AutosAll = ControladorAuto.getAllxPrecio(PrecioMin, PrecioMax);
ArrayList<Marca> MarcasAll = new ArrayList<Marca>();            		
MarcasAll = CatalogoMarca.GetAll();
     String usuario ="";                        
    try{ 
    if(session.getAttribute("usuario") != null){
        usuario = (String)"<b>"+session.getAttribute("usuario")+"</b>";
        
   
  
%>
<br>
                   <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><%=usuario %><span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="ServletLogOut">Logout</a></li>
      		
          </ul>
        </li>
<%  }
    else
    { 
%>    	
					<a class="navbar-brand" href="nuevologin.jsp">Login</a>
					<a class="navbar-brand" href="SingUp.jsp">Registrarse</a>
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

    <!-- Page Content -->
    <div class="container">
		<form id="FormFiltro" action="ServletFiltraxPrecio" method ="post">
        <div class="row">
			
       <div class="col-md-3" float=left>
                <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">Rosario Comenta-Búsqueda</h3>
                            </div>
                            <div class="panel-body">
                               <p><b>**Por marca**</b></p>
                                
                                <div class="form-group">
                               <select name="marcas" class="form-control" onchange="location=this.value">
                                    <option value="inicio.jsp">Seleccione marca</option>
                                    <%for(int h=0; h<MarcasAll.size();h++){ %>
                                    <option value ="inicioxMarca.jsp?nom_marca=<%=MarcasAll.get(h).getDescrip_marca()%>"> <%=MarcasAll.get(h).getDescrip_marca()%></option>
                                  	        	<%} %>
                                </select>
                                
                            </div>
                          
                           
                           
                            <form id="FormFiltro" action="ServletFiltraxPrecio" method ="post" onsubmit="return validaCampos();">
                            <div>
                            <p><b>**Por Precio**</b></p>
                            <label for="ValueMin">Valor Minimo</label>
                            <div class="input-group">
  								<span class="input-group-addon">$</span>
 								<input class="form-control" id="ValueMin"  name="ValueMin"type="number" onkeypress="return justNumbers(event);">
  			
							</div>
							<label for="ValueMax">Valor Maximo</label>
							<div class="input-group">
  								<span class="input-group-addon">$</span>
 								<input class="form-control" id="ValueMax" name="ValueMax" type="number" onkeypress="return justNumbers(event);">
							</div>
  							<div class="filter range pricerange col-md-offset-4">
							<br>
							
							<button type="submit" class="btn btn-primary btn-md">Filtrar</button>
							</div>
							
							</div>
							</form>
                 
                   </div>
                        </div>
                
                  
                          
                           
            </div>
           
            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class=""></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1" class=""></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2" class="active"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item">
                                    <img class="slide-image" src="img/bmw.jpg" alt="">
                                </div>
                                <div class="item active left">
                                    <img class="slide-image" src="img/MB.jpg" alt="">
                                </div>
                                <div class="item next left">
                                    <img class="slide-image" src="img/audi.png" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>
				<form id="submitForm" name="submitForm" action="ServletSeleccionaAuto" method="post">
                <div class="row">
					
					<%for(int i=0; i<AutosAll.size();i++){ %>
                    
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="img/<%=AutosAll.get(i).getImagen()%>" alt="">
                            <div class="caption">
                                <h4><a id="cod_auto" href="selectOne.jsp?cod_auto=<%=AutosAll.get(i).getCod_auto()%>"><%=CatalogoMarca.GetOneCod(AutosAll.get(i).getCod_marca()).getDescrip_marca()%>-<%=AutosAll.get(i).getNombre_auto() %></a>
                                </h4>
                                <p><%=AutosAll.get(i).getDescripcionAuto()%></p>
                                <br>
                                <h4 class="pull-right">U$D<%=AutosAll.get(i).getPrecio() %></h4>
                            </div>
                            <div class="ratings">
                                <p class="pull-right"><%=ControladorComentario.getAll(AutosAll.get(i).getCod_auto()).size() %> Comentarios</p>
                                <p>
                                    <% int Valoracion = AutosAll.get(i).getValoracion();
                                    for(int j=0; j<Valoracion;j++){ %>
                                   <span class="glyphicon glyphicon-star"></span>
                                	   			<%} %>
                                   <%for(int m=0;m<(5-Valoracion);m++){ %>
                                	<span class="glyphicon glyphicon-star-empty"></span>
                                	<%} %>
                                </p>
                                
                            </div>
                        </div>
                    </div>
					
                          <% } %>              
				
                </div>
				</form>
            </div>

        </div>
</form>
    </div>
    <!-- /.container -->

    <div class="container">

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright © Java Final 2015</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function justNumbers(e)
{
var keynum = window.event ? window.event.keyCode : e.which;
if ((keynum == 8) || (keynum == 46))
return true;
 
return /\d/.test(String.fromCharCode(keynum));
}	</script>
<script type="text/javascript">
function validaCampos()
{	
	
	if(ValueMin.value == "" || ValueMax.value =="" )
		{
		alert("Debe tener un valor Minimo y Maximo");
		return false;
		}
	else
		{
		return true; }
	}

</script>
</body></html>