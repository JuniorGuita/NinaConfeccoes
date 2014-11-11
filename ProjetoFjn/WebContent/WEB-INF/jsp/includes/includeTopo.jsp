<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nina Confecções</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-2.1.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/estilo.css" rel="stylesheet">


</head>
<body>
<div class="container">
		<div id="topo" class="row">
			<div id="logo" class="col-md-8"><a href="${linkTo[indexController].index()}">LOGOMARCA</a></div>
			<div id="sairSessao" class="col-md-4">Usuário Logado: ${sessionUser.usuario.nome }  - <a href="${linkTo[loginController].logout()}">sair</a></div>
		</div>

		<div id="menu" class="dropdown">
			<button class="btn dropdown-toggle" type="button"
				data-toggle="dropdown">
				Cadastrar <span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
				<li><a href="${linkTo[ClienteController].form()}">Clientes</a></li>
				<li><a href="#">Fornecedores</a></li>
				<li><a href="#">Produtos</a></li>
				<li><a href="${linkTo[usuarioController].form()}">Usuários</a></li>
			</ul>
		</div>
