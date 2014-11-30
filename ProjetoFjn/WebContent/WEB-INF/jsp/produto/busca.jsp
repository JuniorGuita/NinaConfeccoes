<jsp:include page="../index/menu.jsp">
   <jsp:param value="Resultados da Busca" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Resultados</legend>
		
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form"
					action="${linkTo[ProdutoController].busca()}">

					<div class="form-group">
						Produto (nome): <input type="text">

						<button class="btn btn-success btn-sm">Buscar</button>
					</div>
				</form>
			</div>
		</div>
		
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>

				<!-- Table -->
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Código:</th>
							<th>Marca:</th>
							<th>Nome:</th>
							<th>Valor:</th>
							<th>Editar:</th>
							<th>Deletar:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${produtos}" var="produto">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${produto.codigo}</td>
								<td>${produto.marca}</td>
								<td>${produto.nome}</td>
								<td>R$${produto.valor}</td>
								<td><a href="${linkTo[ProdutoController].editar(produto.id)}"><span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a href="${linkTo[ProdutoController].deletar(produto.id)}"><span class="glyphicon glyphicon-trash"></span></a></td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
	</div>

	<%@include file="../index/footer.jsp"%>
</body>
</html>