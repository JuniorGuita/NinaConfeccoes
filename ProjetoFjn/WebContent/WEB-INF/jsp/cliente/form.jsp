<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="author" content="Antonio Siqueira" />
<%@include file="../includes/header.jsp"%>
<title>Cadastrar Cliente</title>


</head>
<body>

	<%@include file="../includes/includeTopo.jsp"%>
	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[ClienteController].salvar()}" method="post">


			<!-- Form Name -->
			<legend>Cadastro de Clientes</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Nome:
				</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.nome" placeholder="Nome..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Sexo:
				</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.sexo" placeholder="Sexo..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cpf: </label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.cpf" placeholder="cpf..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Rg</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.rg" placeholder="rg..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>



			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Logradouro</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.logradouro"
						placeholder="logradouro..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Numero</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.numero"
						placeholder="numero..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Bairro</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.bairro"
						placeholder="bairro..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Complemento</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.complemento"
						placeholder="complemento..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>


			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Estado</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.cidade.estado.estado"
						placeholder="estado..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cidade</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.cidade.cidade"
						placeholder="cidade..." class="input-xlarge form-control"
						required="" type="text">

				</div>
			</div>
			<div class="row">
				<!-- Button -->
				<div class="control-group">
					<div class="col-md-12 text-right">
						<button id="singlebutton" name="singlebutton"
							class="btn btn-success btn-lg">Cadastrar</button>
						<p style="color: green;">${message}</p>
					</div>
				</div>
			</div>

		</form>
	</div>
	<%@include file="../includes/includeFooter.jsp"%>

</body>
</html>