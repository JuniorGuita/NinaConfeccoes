
<jsp:include page="../includes/includeTopo.jsp">
	<jsp:param value="Produto - Novo" name="title" />
</jsp:include>
<div class="container">
	<legend>Lista de Produtos Cadastrados</legend>
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

					<c:forEach items="${listarProdutos}" var="produto">
						<c:set var="incremento" value="${incremento + 1}"></c:set>
						<tr>
							<td>${incremento}</td>
							<td>${produto.codigo}</td>
							<td>${produto.marca}</td>
							<td>${produto.nome}</td>
							<td>R$${produto.valor}</td>
							<td><span class="glyphicon glyphicon-pencil"></span></td>
							<td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
						</tr>

					</c:forEach>
				</tbody>
			</table>
		</div>

	</div>
</div>

<%@include file="../includes/includeFooter.jsp"%>
</body>
</html>