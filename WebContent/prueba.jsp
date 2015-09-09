<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href='http://fonts.googleapis.com/css?family=Creepster|Audiowide' rel='stylesheet' type='text/css'>
<style type="text/css">
body{
				font-family: 'Audiowide', cursive, arial, helvetica, sans-serif;
				background:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAoAAAAKCAYAAACNMs+9AAAAUElEQVQYV2NkYGAwBuKzQAwDID4IoIgxIikAMZE1oRiArBDdZBSNMIXoJiFbDZYDKcSmCOYimDuNSVKIzRNYrUYOFuQgweoZbIoxgoeoAAcAEckW11HVTfcAAAAASUVORK5CYII=) repeat;
				background-color:#191970/*212122*/;
				color:white;
				font-size: 18px;
				padding-bottom:20px;
			}
</style>
<title>Insert title here</title>
</head>
<body>
<form name="datos" id="datos" action="ServletLogin" class="form-horizontal" method="post" onsubmit="return validar();">
								<fieldset>
									<div class="input-prepend" >
										<span class="add-on"><i class="icon-user"></i></span><input class="input-large span10" name="username" id="username" type="text" placeholder="user" />
									</div>
									<div class="clearfix"></div>

									<div class="input-prepend" >
										<span class="add-on"><i class="icon-lock"></i></span><input class="input-large span10" name="password" id="password" type="password" placeholder="pass" />
									</div>
									<div class="clearfix"></div>

									<p class="center span4">
									<button type="submit" class="btn btn-primary">Ingresar</button>
									</p>
								</fieldset>

						</form>
</body>
</html>