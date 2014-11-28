<jsp:include page="../index/menu.jsp">
	<jsp:param value="Adicionar produtos no carrinho" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form"
					action="${linkTo[CarrinhoController].adicionar()}2">
					<legend>Carrinho de Compras</legend>
					<div class="form-group">
						Produto: <input type="text" name="nome_produto" id="nome_produto">
						Qtd: <input type="text" name="qtde_produto" id="qtde_produto">

						<button id="singlebutton" name="singlebutton"
							class="btn btn-success btn-sm">Adicionar</button>

						<%-- <a href="${linkTo[CarrinhoController].adicionar()}2">Adicionar
							produto 2</a> --%>
					</div>
				</form>
			</div>
		</div>
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>
				<table class="table">
					<thead>
						<tr>
							<th>Item</th>
							<th>Marca</th>
							<th>Quantidade</th>
							<th>Excluir</th>
							<th>Subtotal</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${sessionCart.carrinho.itens}" var="elemento">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${elemento.produto.nome}</td>
								<td>${elemento.produto.marca}</td>
								<td>${elemento.quantidade}</td>
								<td><a
									href="${linkTo[CarrinhoController].remover()}${incremento-1}"><span
										class="glyphicon glyphicon-trash"></span></a></td>
								<td>${elemento.produto.valor}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row text-right">
		<strong>TOTAL: </strong><input type="text">
		</div>
	</div>




	<script>
		$(document).ready(function() {
			$("#nome_produto").on("keyup", function() {
				if (($(this).val().length) >= 2) {
					var string = $(this).val();
					pesquisarProduto(string);
				}
			});
		});

		function pesquisarProduto(string) {
			$.getJSON('<c:url value="/produto/pesquisar/' + string + '" />',
					{}, function(json) {
						console.log(json);
					});
		}

		function popularSelect(element, json) {
			var options = "";
			$.each(json.cidades, function(chave, valor) {
				options += "<option value='" + valor.id + "'>" + valor.cidade
						+ "</option>";
			});
			$("#" + element).html(options);
		}
	</script>
</body>
</html>