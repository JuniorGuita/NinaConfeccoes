<jsp:include page="../index/menu.jsp">
   <jsp:param value="Editar Usuário" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
</head>
<body>
	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[usuarioController].salvarAlteracoes()}" method="post">
				<!-- Form Name -->
				<legend>Editar Usuário</legend>



				<c:choose>
					<c:when test="${status}">
						<div id="messageUsuario" class="${classeCss}">${message}</div>
					</c:when>
				</c:choose>


				<!-- Text input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="textinput">Nome:
					</label>
					<div class="col-md-10">
						<input id="textinput" name="usuario.nome" placeholder="nome..."
						value="${obj.nome}"
							class="input-xlarge form-control" required="" type="text">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.pass"
							placeholder="senha..." value="${obj.pass}" class="input-xlarge form-control"
							required="" type="password">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Confirmar
						Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.confirmPass"
							placeholder="confirmar senha..." value="${obj.confirmPass}"
							class="input-xlarge form-control" required="" type="password">

					</div>
				</div>
				
				<input type="hidden" name="usuario.id" value="${obj.id}">

				<!-- Button -->
				<div class="row">
					<div class="control-group">
						<div class="col-md-12 text-right">
							<button id="singlebutton" name="singlebutton"
								class="btn btn-success btn-lg">Cadastrar</button>
						</div>
					</div>
				</div>
		</form>
	</div>
	<%@include file="../index/footer.jsp"%>
</body>
</html>