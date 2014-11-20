<jsp:include page="../index/menu.jsp">
	<jsp:param value="Novo Cliente" name="title" />
</jsp:include>
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
				<div class="col-md-10">
					<input id="textinput" name="cliente.nome" placeholder="Nome..."
						class="input-xlarge form-control" type="text">
				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Sexo:
				</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.sexo" placeholder="Sexo..."
						class="input-xlarge form-control" type="text">

				</div>
			</div>


			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cpf: </label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.cpf" placeholder="cpf..."
						class="input-xlarge form-control" type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Rg</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.rg" placeholder="rg..."
						class="input-xlarge form-control" type="text">

				</div>
			</div>



			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Logradouro</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.logradouro"
						placeholder="logradouro..." class="input-xlarge form-control"
						type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Numero</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.numero"
						placeholder="numero..." class="input-xlarge form-control"
						type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Bairro</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.bairro"
						placeholder="bairro..." class="input-xlarge form-control"
						type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Complemento</label>
				<div class="col-md-10">
					<input id="textinput" name="cliente.endereco.complemento"
						placeholder="complemento..." class="input-xlarge form-control"
						type="text">

				</div>
			</div>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Estado</label>
				<div class="col-md-10">
					<select name="cliente.endereco.estado.estado" id="estado">
						<option value="0">..selecione..</option>

						<c:forEach var="uf" items="${estados}">
							<option value="${uf.id}">${uf.estado}</option>
						</c:forEach>
					</select>
				</div>
			</div>

			<!-- Select municipios -->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Cidade</label>
				<div class="col-md-10">
					<select name="cliente.endereco.cidade.cidade" id="municipios">
					</select>
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

	<%@include file="../index/footer.jsp"%>


	<script type="text/javascript">
		$(function() {
			$("#estado").on("change", function() {
				consultar($(this).val());
			});
		});

		function consultar(id) {

			$.getJSON('<c:url value="/cidade/getjson/"' + id + '/>', function(
					json) {
				popularSelect("municipios", json);
			});
		}

		function popularSelect(element, json) {
			var options = "";
			$.each(json, function(chave, valor) {
				options += "<option value='" + valor.id + "'>" + valor.cidade
						+ "</option>";
			});
			$("#" + element).html(options);
		}
	</script>
</body>
</html>