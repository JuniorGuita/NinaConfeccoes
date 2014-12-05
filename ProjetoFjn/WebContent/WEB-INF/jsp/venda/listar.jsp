<jsp:include page="../index/menu.jsp">
   <jsp:param value="Lista Vendas" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Vendas Cadastrados</legend>
		
		
		
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>

				<!-- Table -->
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Item:</th>
							<th>Marca:</th>
							<th>Valor(un):</th>
							<th>Quantidade:</th>
							<th>Total:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarVendas}" var="venda">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${venda.itens[0].produto.nome}</td>
								<td>${venda.itens[0].produto.marca}</td>
								<td><fmt:formatNumber type="number"	minFractionDigits="2">${venda.itens[0].produto.valor}</td></fmt:formatNumber>
								<td>${venda.itens[0].quantidade}</td>
								<td>R$${venda.total}</td>
								
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