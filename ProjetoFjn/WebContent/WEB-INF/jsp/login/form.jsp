<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Página de Login</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
		$(document).ready(function(){
			
			$('#nomeUser').click(function(){
				$('#aviso').hide();
			});
			$('#passUser').click(function(){
				$('#aviso').hide();
			});
			
		});
</script>


</head>
<body style="background-color: #eee;">
	<div class="container">
    		<p><br/></p>
    		<p><br/></p>
    		<p><br/></p>
  		<div class="row">
  			<div class="col-md-4"></div>
  			<div class="col-md-4">
  				<div class="panel panel-default">
  					<div class="panel-body">
    						<div class="page-header">
  							<h3>Área de Login</h3>
						</div>
						<form action="${linkTo[loginController].login}" role="form" method="post">
  							<div class="form-group">
  							<p id="aviso" style="color: red;">${message}</p>
    								<label for="exampleInputEmail1">Nome de Usuário: </label>
    								<div class="input-group">
  									<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
  									<input type="text" class="form-control" id="nomeUser" name="usuario.nome"  placeholder="Nome...">
								</div>
  							</div>
  							<div class="form-group">
    								<label for="exampleInputPassword1">Senha: </label>
    								<div class="input-group">
  									<span class="input-group-addon"><span class="glyphicon glyphicon-star"></span></span>
  									<input type="password" class="form-control" id="passUser" name="usuario.pass"  placeholder="Senha...">
								</div>
  							</div>
  							<hr/>
  							<button type="submit" class="btn btn-primary"><span class="glyphicon glyphicon-lock"></span> Login</button>
  							<p><br/></p>
						</form>
  					</div>
				</div>
  			</div>
		</div>
    </div>
    
    
    
</body>
</html>