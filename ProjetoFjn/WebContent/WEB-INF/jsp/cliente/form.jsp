<jsp:include page="../index/menu.jsp">
	<jsp:param value="Novo Cliente" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[ClienteController].salvar()}" method="post">
			<!-- Form Name -->
			<legend>Cadastro de Clientes</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Nome:
				</label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.nome" placeholder="Nome..."
						class="input-xlarge form-control" type="text">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Sexo:
				</label>
				<div class="col-md-4">
					<!-- <input id="textinput" name="cliente.sexo" placeholder="Sexo..."
						class="input-xlarge form-control" type="text"> -->
					<select name="cliente.sexo" class="form-control">
						<option value="0">...</option>
						<option value="F">F</option>
						<option value="M">M</option>
					</select>

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cpf: </label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.cpf" placeholder="cpf..."
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Rg</label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.rg" placeholder="rg..."
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- inclusão do formulario  -->
			<jsp:include page="../includes/endereco_form.jsp">
				<jsp:param value="cliente" name="objeto" />
			</jsp:include>




			<div class="row">
				<!-- Button -->
				<div class="control-group">
					<div class="col-md-6 text-right">
						<button id="singlebutton" name="singlebutton"
							class="btn btn-success btn-lg">Cadastrar</button>
						<p style="color: green;">${message}</p>
					</div>
				</div>
			</div>
		</form>
	</div>

	<%@include file="../index/footer.jsp"%>
</body>
</html>