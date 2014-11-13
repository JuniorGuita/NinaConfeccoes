<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="author" content="Antonio Siqueira" />
<%@include file="../includes/header.jsp"%>
</head>
<body>
	<%@include file="../includes/includeTopo.jsp"%>
	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[usuarioController].salvar()}" method="post">

				<!-- Form Name -->
				<legend>Cadastrar Usuário</legend>
				<c:choose>
					<c:when test="${status}">
						<div id="messageUsuario" class="${classeCss}">${message}!!!</div>
					</c:when>
				</c:choose>


				<!-- Text input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="textinput">Nome:
					</label>
					<div class="col-md-10">
						<input id="textinput" name="usuario.nome" placeholder="nome..."
							class="input-xlarge form-control" required="" type="text">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.pass"
							placeholder="senha..." class="input-xlarge form-control"
							required="" type="password">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Confirmar
						Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.confirmPass"
							placeholder="confirmar senha..."
							class="input-xlarge form-control" required="" type="password">

					</div>
				</div>

				<!-- Button -->
				<div class="row">
					<div class="control-group">
						<div class="col-md-12 text-right">
							<button id="singlebutton" name="singlebutton"
								class="btn btn-success btn-lg">Cadastrar</button>
						</div>
					</div>
				</div>
		</form>
	</div>
	<%@include file="../includes/includeFooter.jsp"%>
</body>
</html>