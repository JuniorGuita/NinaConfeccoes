<<<<<<< HEAD
<jsp:include page="../index/menu.jsp">
   <jsp:param value="Lista de Usuários" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<legend>Lista de Usuários Cadastrados</legend>
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>
				<!-- Table -->
				<table class="table">
					<thead>
=======
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
>>>>>>> nome_do_branch
						<tr>
							<td>${incremento}</td>
							<td>${usuario.nome}</td>
							<td>${usuario.pass}</td>
							<td><span class="glyphicon glyphicon-pencil"></span></td>
							<td><span class="glyphicon glyphicon-trash"></span></td>
						</tr>
<<<<<<< HEAD
					</thead>
					<tbody>

						<c:forEach items="${listarUsuarios}" var="usuario">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${usuario.nome}</td>
								<td>${usuario.pass}</td>
								<td><span class="glyphicon glyphicon-pencil"></span></td>
								<td><a href="${linkTo[usuarioController].deletar(usuario.id)}"><span class="glyphicon glyphicon-trash"></span></a></td>
							</tr>
=======
>>>>>>> nome_do_branch

					</c:forEach>


				</tbody>
			</table>
		</div>

	</div>
</div>

<<<<<<< HEAD
	<%@include file="../index/footer.jsp"%>
=======
<%@include file="../includes/includeFooter.jsp"%>
>>>>>>> nome_do_branch
</body>
</html>