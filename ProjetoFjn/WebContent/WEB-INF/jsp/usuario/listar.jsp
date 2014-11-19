<jsp:include page="../includes/includeTopo.jsp">
	<jsp:param value="Usuários - Todos" name="title" />
</jsp:include>
<div class="container">
	<legend>Lista de Usuários Cadastrados</legend>
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
							<td><span class="glyphicon glyphicon-pencil"></span></td>
							<td><span class="glyphicon glyphicon-trash"></span></td>
						</tr>

					</c:forEach>


				</tbody>
			</table>
		</div>

	</div>
</div>

<%@include file="../includes/includeFooter.jsp"%>
</body>
</html>