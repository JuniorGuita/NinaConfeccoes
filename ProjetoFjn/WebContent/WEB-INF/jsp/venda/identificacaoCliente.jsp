<jsp:include page="../index/menu.jsp">
	<jsp:param value="Identifique o cliente" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>
<body>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<input type="text" id="nomeCliente"
					placeholder="Digite o nome do cliente">

				<hr>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="panel panel-default">
					<!-- Default panel contents -->
					<div class="panel-heading">Selecione um cliente para
						finalizar a venda</div>
					<table class="table table-striped table-bordered"
						id="listaClientes">
						<tr>
							<th>Cliente</th>
							<th>RG</th>
							<th>CPF</th>
							<th></th>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(document).ready(function() {
			$("#nomeCliente").on("keyup", function() {
				if (($(this).val().length) >= 2) {
					var string = $(this).val();
					pesquisarCliente(string);
				}
			});
		});

		function pesquisarCliente(string) {
			$.getJSON('../cliente/clientejson/' + string, {}, function(json) {
				exibeClientes(json);
			});
		}

		function exibeClientes(json) {
			var aux = "";
			$("#listaClientes").empty();
			$
					.each(
							json.clientes,
							function(chave, valor) {
								aux += "<tr>";
								aux += "<td>" + valor.nome + "</td>";
								aux += "<td>" + valor.cpf + "</td>";
								aux += "<td>" + valor.rg + "</td>";
								aux += '<td><a href="definirCliente/' + valor.id + '" class="btn btn-primary btn-sm">selecionar</td>';
								aux += "</tr>";
							});

			$("#listaClientes").append(aux);
		}
	</script>
</body>
</html>