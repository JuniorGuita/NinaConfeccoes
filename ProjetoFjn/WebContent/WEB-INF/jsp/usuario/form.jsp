<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cadastrar Usuário</title>
</head>
<body>
	<%@include file="../includes/includeTopo.jsp" %>

	<form class="form-horizontal" action="${linkTo[usuarioController].salvar()}" method="post">
		<fieldset>

			<!-- Form Name -->
			<legend>Cadastrar Usuário</legend>

			<!-- Text input-->
			<div class="control-group">
				<label class="control-label" for="textinput">Nome: </label>
				<div class="controls">
					<input id="textinput" name="usuario.nome" placeholder="nome..."
						class="input-xlarge" required="" type="text">

				</div>
			</div>

			<!-- Password input-->
			<div class="control-group">
				<label class="control-label" for="passwordinput">Senha:</label>
				<div class="controls">
					<input id="passwordinput" name="usuario.pass"
						placeholder="senha..." class="input-xlarge" required=""
						type="password">

				</div>
			</div>

			<!-- Password input-->
			<div class="control-group">
				<label class="control-label" for="passwordinput">Confirmar
					Senha:</label>
				<div class="controls">
					<input id="passwordinput" name="usuario.confirmPass"
						placeholder="confirmar senha..." class="input-xlarge" required=""
						type="password">

				</div>
			</div>

			<!-- Button -->
			<div class="control-group">
				<label class="control-label" for="singlebutton"></label>
				<div class="controls">
					<button id="singlebutton" name="singlebutton"
						class="btn btn-success">Salvar</button>
						<p style="color: green;">${message}</p>
				</div>
			</div>

		</fieldset>
	</form>

</body>
</html>