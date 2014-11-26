<jsp:include page="../index/menu.jsp">
	<jsp:param value="Editar Fornecedor" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[FornecedorController].salvarAlteracoes()}" method="post">
			<!-- Form Name -->
			<legend>${tituloFormulario}</legend>
			<p style="color: green;">${message}</p>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Nome:
				</label>
				<div class="col-md-4">
					<input id="textinput" name="fornecedor.nome" placeholder="Nome do fornecedor"
					value="${obj.nome}"
						class="input-xlarge form-control" type="text">
				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">CNPJ</label>
				<div class="col-md-4">
					<input id="textinput" name="fornecedor.cnpj" placeholder="CNPJ"
					value="${obj.cnpj}"
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- inclusão do formulario  -->
			<jsp:include page="../includes/endereco_form.jsp">
				<jsp:param value="fornecedor" name="objetoName" />
			</jsp:include>
			
			<input type="hidden" name="fornecedor.id" value="${obj.id}">
			<input type="hidden" name="fornecedor.endereco.id" value="${obj.endereco.id}">
			
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