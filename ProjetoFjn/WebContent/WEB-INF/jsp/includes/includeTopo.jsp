<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="author" content="Antonio Siqueira" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


</head>
<body>
<div class="container">
		<div id="topo" class="row">
			<div id="logo" class="col-md-8"><a href="${linkTo[indexController].index()}">LOGOMARCA</a></div>
			<div id="sairSessao" class="col-md-4">Usu�rio Logado: ${sessionUser.usuario.nome }  - <a href="${linkTo[loginController].logout()}">sair</a></div>
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
						<li><a href="${linkTo[usuarioController].form()}">Usu�rios</a></li>
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
						<li><a href="#">Lista de Produtos</a></li>
						<li><a href="#">Lista de Usu�rios</a></li>
					</ul>
				</div>
		</div>


</div>