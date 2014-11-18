<jsp:include page="header.jsp">
  <jsp:param value="${param.title}" name="title"/>
</jsp:include>
<div class="container">
		<div id="topo" class="row">
			<div id="logo" class="col-md-8"><a href="${linkTo[indexController].index()}">LOGOMARCA</a></div>
			<div id="sairSessao" class="col-md-4">Usuário Logado: ${sessionUser.usuario.nome }  - <a href="${linkTo[loginController].logout()}">sair</a></div>
		</div>
		
		<div class="row">
				<div id="menu" class="dropdown btn-group btn-group-lg">
					<button class="btn dropdown-toggle" type="button"
						data-toggle="dropdown">
						Cadastrar <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="${linkTo[ClienteController].form()}">Clientes</a></li>
						<li><a href="#">Fornecedores</a></li>
						<li><a href="${linkTo[ProdutoController].form()}">Produtos</a></li>
						<li><a href="${linkTo[usuarioController].form()}">Usuários</a></li>
					</ul>
				</div>
				
				<div id="menu" class="dropdown btn-group btn-group-lg">
					<button class="btn dropdown-toggle" type="button"
						data-toggle="dropdown">
						Gerenciar <span class="caret"></span>
					</button>
					<ul class="dropdown-menu">
						<li><a href="#">Lista de Clientes</a></li>
						<li><a href="#">Lista de Fornecedores</a></li>
						<li><a href="${linkTo[ProdutoController].listar()}">Lista de Produtos</a></li>
						<li><a href="${linkTo[usuarioController].listar()}">Lista de Usuários</a></li>
					</ul>
				</div>
		</div>


</div>