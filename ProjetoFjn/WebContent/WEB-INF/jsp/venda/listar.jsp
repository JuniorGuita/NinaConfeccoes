<jsp:include page="../index/menu.jsp">
   <jsp:param value="Lista Vendas" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Vendas Cadastrados</legend>
		
		<div class="row">
			<div class="col-lg-12 col-md-12">
			
				<form class="form-horizontal" role="form" method="get"
					action="">

					<div class="form-group">
						Venda (data): <input type="text" name="string">
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
							<th>Cliente:</th>
							<th>Data:</th>
							<th>Total:</th>
							<th>Deletar:</th>
							<th></th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarVendas}" var="venda">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${venda.cliente.nome}</td>
								<td>${venda.calendar}</td>
								<td>R$${venda.total}</td>
								<td><a href="${linkTo[VendaController].deletar(venda.id)}"><span class="glyphicon glyphicon-trash"></span></a></td>
								<td><a href="${linkTo[VendaController].detalhar(venda.id)}"><span>Detalhes</span></td>
								
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