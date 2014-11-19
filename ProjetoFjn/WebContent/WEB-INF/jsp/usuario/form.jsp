<<<<<<< HEAD
<jsp:include page="../index/menu.jsp">
   <jsp:param value="Novo Usuário" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
=======
<jsp:include page="../includes/includeTopo.jsp">
	<jsp:param value="Usuários - Novo" name="title" />
</jsp:include>
>>>>>>> nome_do_branch
</head>
<body>
	<div class="container">
		<form class="form-horizontal"
			action="${linkTo[usuarioController].salvar()}" method="post">
				<!-- Form Name -->
				<legend>Cadastrar Usuário</legend>



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
							class="input-xlarge form-control" required="" type="text">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.pass"
							placeholder="senha..." class="input-xlarge form-control"
							required="" type="password">

					</div>
				</div>

				<!-- Password input-->
				<div class="form-group">
					<label class="control-label col-md-2" for="passwordinput">Confirmar
						Senha:</label>
					<div class="col-md-10">
						<input id="passwordinput" name="usuario.confirmPass"
							placeholder="confirmar senha..."
							class="input-xlarge form-control" required="" type="password">

					</div>
				</div>

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