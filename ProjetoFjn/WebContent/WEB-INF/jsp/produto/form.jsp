<jsp:include page="../index/menu.jsp">
   <jsp:param value="Novo Produto" name="title"/>
</jsp:include>
</head>
<body>

	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[ProdutoController].salvar()}" method="post">

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Codigo:
			</label>
			<div class="col-md-10">
				<input id="textinput" name="produto.codigo" placeholder="codigo..."
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Marca:
			</label>
			<div class="col-md-10">
				<input id="textinput" name="produto.marca" placeholder="marca..."
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Nome: </label>
			<div class="col-md-10">
				<input id="textinput" name="produto.nome" placeholder="nome..."
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Valor:
			</label>
			<div class="col-md-10">
				<input id="textinput" name="produto.valor" placeholder="R$99,99..."
					class="input-xlarge form-control" required="" type="text">

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

</body>
</html>