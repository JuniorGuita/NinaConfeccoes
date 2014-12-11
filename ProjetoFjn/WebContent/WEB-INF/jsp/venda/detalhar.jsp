<jsp:include page="../index/menu.jsp">
	<jsp:param value="Detalhes da Venda" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>
	<div class="container">
		<legend>Detalhes da Venda</legend>



		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>

				<!-- Table -->
				<table class="table">
					<thead>
						<tr>
							<th>Cliente: ${obj.cliente.nome}</th>
							<th>Data: ${obj.calendar}</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						<tr>
							<th>Item:</th>
							<th>Marca:</th>
							<th>Valor( Un ):</th>
							<th>Quantidade:</th>
							<th>Parcial:</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${listar}" var="venda">
							<td>${venda.produto.nome}</td>
							<td>${venda.produto.marca}</td>
							<td>R$${venda.produto.valor}</td>
							<td>${venda.quantidade}</td>
							<td>R$${venda.produto.valor * venda.quantidade}</td>
							<tr></tr>
						</c:forEach>
					</tbody>
				</table>
			</div>

<span colspan="5" class="text-right"><strong>Total: </strong>R$${obj.total}</span>
			<div class="row">
				<div class="col-lg-12 col-md-12">
					<div class="text-right">
						<a href="${linkTo[VendaController].listar()}" class="btn btn-success btn-md">Voltar</button> </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="../index/footer.jsp"%>
</body>
</html>