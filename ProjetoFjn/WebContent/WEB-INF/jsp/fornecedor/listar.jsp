<jsp:include page="../index/menu.jsp">
	<jsp:param value="Lista de Fornecedores" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="container">
		<legend>Lista de Fornecedores Cadastrados</legend>
		
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form" method="get"
					action="${linkTo[FornecedorController].busca}">

					<div class="form-group">
						Fornecedor (nome): <input type="text" name="string">

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
							<th>Nome:</th>
							<th>CPNJ:</th>
							<th>Telefone:</th>
							<th>Editar:</th>
							<th>Deletar:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${fornecedores}" var="fornecedor">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${fornecedor.nome}</td>
								<td>${fornecedor.cnpj}</td>
								<td>${fornecedor.telefone}</td>
								<td>
								<a
									href="${linkTo[FornecedorController].editar(fornecedor.id)}">
								<span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a
									href="${linkTo[FornecedorController].deletar(fornecedor.id)}">
										<span class="glyphicon glyphicon-trash"></span>
								</a></td>
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