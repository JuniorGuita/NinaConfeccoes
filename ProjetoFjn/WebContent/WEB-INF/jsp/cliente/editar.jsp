<jsp:include page="../index/menu.jsp">
	<jsp:param value="Editar Cliente" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<div class="container">	
		<form class="form-horizontal"
			action="${linkTo[ClienteController].salvarAlteracoes()}" method="post">
			<!-- Form Name -->
			<legend>Cadastro de Clientes</legend>
			<p style="color: green;">${message}</p>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Nome:
				</label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.nome" placeholder="Nome..."
					value="${obj.nome}"
						class="input-xlarge form-control" type="text">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Sexo:
				</label>
				<div class="col-md-4">
					<select name="cliente.sexo"  class="form-control">
						<option value="${obj.sexo}" >${obj.sexo}</option>
						<option value="F">F</option>
						<option value="M">M</option>
					</select>

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Telefone: </label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.telefone" placeholder="telefone..."
					value="${obj.telefone}"
						class="input-xlarge form-control" type="text">

				</div>
			</div>
			

			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cpf: </label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.cpf" placeholder="cpf..."
					value="${obj.cpf}"
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Rg</label>
				<div class="col-md-4">
					<input id="textinput" name="cliente.rg" placeholder="rg..."
					value="${obj.rg}"
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- inclusão do formulario  -->
			<jsp:include page="../includes/endereco_form.jsp">
				<jsp:param value="cliente" name="objetoName" />
			</jsp:include>

			<input type="hidden" name="cliente.id" value="${obj.id}">
			<input type="hidden" name="cliente.endereco.id" value="${obj.endereco.id}">



			<div class="row">
				<!-- Button -->
				<div class="control-group">
					<div class="col-md-6 text-right">
						<button id="singlebutton" name="singlebutton"
							class="btn btn-success btn-lg">Cadastrar</button>
					</div>
				</div>
			</div>
		</form>
	</div>

	<%@include file="../index/footer.jsp"%>
</body>
</html>