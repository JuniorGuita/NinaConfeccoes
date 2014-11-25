
<jsp:include page="../index/menu.jsp">
   <jsp:param value="Editar Produto" name="title"/>
</jsp:include>
</head>
<body>

	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[ProdutoController].salvarAlteracoes()}" method="post">

		<input type="hidden" name="produto.id" value="${obj.id}">
		
		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Codigo:
			</label>
			<div class="col-md-10">
				<input id="textinput" name="produto.codigo" placeholder="codigo..."
				value="${obj.codigo}"
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Marca:
			</label>
			<div class="col-md-10">
				<input id="textinput" name="produto.marca" placeholder="marca..."
				value="${obj.marca}"
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Nome: </label>
			<div class="col-md-10">
				<input id="textinput" name="produto.nome" placeholder="nome..."
				value="${obj.nome}"
					class="input-xlarge form-control" required="" type="text">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="control-label col-md-2" for="textinput">Valor: </label>
			<div class="col-md-10">
				<input id="textinput" name="produto.valor" placeholder="R$99,99..."
				value="${obj.valor}"
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