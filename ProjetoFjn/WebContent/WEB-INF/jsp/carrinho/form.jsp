<jsp:include page="../index/menu.jsp">
	<jsp:param value="Adicionar produtos no carrinho" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<table>
		<tr>
			<th>Item</th>
			<th>Quantidade</th>
			<th>Subtotal</th>
		</tr>

		<c:forEach items="${sessionCart.carrinho.itens}" var="elemento">
		<c:set var="incremento" value="${incremento + 1}"></c:set>
			<tr>
				<td>${elemento.produto.nome}</td>
				<td>${elemento.quantidade}</td>
				<td><a href="${linkTo[CarrinhoController].remover()}${incremento-1}">excluir</a></td>
				<td>${elemento.produto.valor}</td>
			</tr>
		</c:forEach>
	</table>

	<a href="${linkTo[CarrinhoController].adicionar()}2">Adicionar
		produto 2</a>
	<a href="${linkTo[CarrinhoController].adicionar()}3"> Adicionar
		produto 3</a>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<form class="form-horizontal" role="form">
					<div class="form-group">
						<input type="text" name="nome_produto" id="nome_produto">
					</div>
				</form>
			</div>
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
			$.getJSON('<c:url value="/produto/pesquisar/' + string + '" />', {
			}, function(json) {
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