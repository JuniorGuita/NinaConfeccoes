<jsp:include page="../index/menu.jsp">
   <jsp:param value="Lista de Clientes" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Clientes Cadastrados</legend>
		
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form" method="get"
					action="${linkTo[ClienteController].busca()}">

					<div class="form-group">
						Produto (nome): <input type="text" name="string">

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
							<th>CPF:</th>
							<th>Sexo:</th>
							<th>Editar:</th>
							<th>Deletar:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarClientes}" var="cliente">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${cliente.nome}</td>
								<td>${cliente.cpf}</td>
								<td>${cliente.sexo}</td>
								<td><a href="${linkTo[ClienteController].editar(cliente.id)}"><span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a href="${linkTo[ClienteController].deletar(cliente.id)}"><span class="glyphicon glyphicon-trash"></span></a></td>
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