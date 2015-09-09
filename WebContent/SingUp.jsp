<%@page import="negocio.ControladorUsuario"%>
<%@page import="datos.CatalogoUsuarios"%>
<html lang="en"><head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Martin Lopez Jordan">

    <title>Rosario Intercambia</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/singup.css" rel="stylesheet">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<% session.invalidate(); %>
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
                <ul class="nav navbar-nav navbar-right">
                    <div class="pull-right">
                    <a class="navbar-brand" href="nuevologin.jsp">Login</a>
                    </div>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>

    <!-- Page Content -->
    <body>
    <div style="margin-top:50px;" class="col-sm-6 col-md-4 col-md-offset-4">

        <form class="form form-signup" id="form-singup" action="ServletNuevoUsuario" method="post" onsubmit=" return validaContraseña();">
        <h2 class="form-signin-heading">Registrese</h2>
        <label for="inputUsername" class="sr-only">Nombre</label>
        <input type="text" name ="inputNombre" id="inputNombre" class="form-control" placeholder="Nombre" required="" autofocus="">
        <label for="inputUsername" class="sr-only">Apellido</label>
        <input type="text" name ="inputApellido" id="inputApellido" class="form-control" placeholder="Apellido" required="" autofocus="">
        <label for="inputUsername" class="sr-only">Nombre de Usuario</label>
        <input type="text" name ="inputUsername" id="inputUsername" class="form-control" placeholder="Username" required="" autofocus="" onblur="existe()">
        <label for="inputPassword" class="sr-only">Contraseña</label>
        <input type="password" name="inputPassword" id="inputPassword" class="form-control" placeholder="Password" required="">
        <label for="inputREPassword" class="sr-only">Repita Contraseña</label>
        <input type="password" name="inputREPassword" id="inputREPassword" class="form-control" placeholder="Re-Password" required="">
        <button class="btn btn-lg btn-primary btn-block" type="submit">Registrarse</button>
      </form>
        
    </div>
    <!-- /.container -->
</body>
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
	function validaContraseña()
	{
		if (inputPassword.value != inputREPassword.value) {
			   alert('Comprobación no coincide con la contraseña');
			   return false;
			}
			return true;
		
	}
	
	</script>
	
	<script type="text/javascript">
	function existe()
	{ 
		var existe;
		
		$.ajax({ 
			async: false,
			type : 'POST',
			data : "inputUsername="+inputUsername.value,
			url  : 'existeUsuario.jsp',
			success: function(data){ // Get the result and asign to each cases
				
				if(data==1)
				{
				//Ok
					existe=true;
					alert("Nombre de Usuario existente, ingrese otro");
					inputUsername.focus();		
				}
				else
				{ 	
					existe=false;;
				}
				
			}
				
			});
		
		return existe;
	}
	</script>

</body></html>