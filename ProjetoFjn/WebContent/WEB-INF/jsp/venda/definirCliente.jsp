<jsp:include page="../index/menu.jsp">
	<jsp:param value="Cliente definido com sucesso!" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>
<body>
	<div class="container">
		<div clclass="row">
			<div class="col-lg-12 col-md-12">
				<div class="alert alert-success">Definido com sucesso!</div>
				
				<div class="page-header">
					<h2>${sessionCart.venda.cliente.nome}</h2>
					</div>

				
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">Listagem</div>
					<table class="table">
						<thead>
							<tr>
								<th>Item</th>
								<th>Marca</th>
								<th class="text-right">Valor</th>
								<th class="text-center">Quantidade</th>
								<th class="col-lg-1 text-right">Subtotal</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${sessionCart.venda.itens}" var="elemento">
								<c:set var="incremento" value="${incremento + 1}"></c:set>
								<tr>
									<td>${elemento.produto.nome}</td>
									<td>${elemento.produto.marca}</td>
									<td class="text-right"><fmt:formatNumber type="number"
											minFractionDigits="2">${elemento.produto.valor}
								</fmt:formatNumber></td>
									<td class="text-center">${elemento.quantidade}</td>
									<td class="text-right"><fmt:formatNumber type="number"
											minFractionDigits="2">${elemento.produto.valor * elemento.quantidade}</fmt:formatNumber></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<th colspan="4" class="text-right">Total</th>
								<th class="text-right"><fmt:formatNumber type="number"
										minFractionDigits="2">${sessionCart.venda.total}</fmt:formatNumber></th>
							</tr>
						</tfoot>
					</table>
				</div>

				<a href="" class="btn btn-primary btn-sm">Finalizar venda</a>
			</div>
		</div>
	</div>
	
</body>
</html>