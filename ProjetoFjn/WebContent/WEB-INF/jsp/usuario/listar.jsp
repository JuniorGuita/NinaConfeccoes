<jsp:include page="../index/menu.jsp">
   <jsp:param value="Lista de Usu�rios" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Usu�rios Cadastrados</legend>
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
							<th>Senha:</th>
							<th>Editar:</th>
							<th>Deletar:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarUsuarios}" var="usuario">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${usuario.nome}</td>
								<td>${usuario.pass}</td>
								<td><a href="${linkTo[usuarioController].editar(usuario.id)}"><span class="glyphicon glyphicon-pencil"></span></a></td>
								<td><a href="${linkTo[usuarioController].deletar(usuario.id)}"><span class="glyphicon glyphicon-trash"></span></a></td>
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