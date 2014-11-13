<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="author" content="Antonio Siqueira" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Produtos Cadastrados</title>
</head>
<body>
	<%@include file="../includes/includeTopo.jsp"%>
	<div class="container">
		<legend>Lista de Produtos Cadastrados</legend>
		<div class="row">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">Listagem</div>

				<!-- Table -->
				<table class="table">
					<thead>
						<tr>
							<th>#</th>
							<th>Código:</th>
							<th>Marca:</th>
							<th>Nome:</th>
							<th>Valor:</th>
							<th>Editar:</th>
							<th>Deletar:</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarProdutos}" var="produto">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${produto.codigo}</td>
								<td>${produto.marca}</td>
								<td>${produto.nome}</td>
								<td>R$${produto.valor}</td>
								<td><span class="glyphicon glyphicon-pencil"></span></td>
								<td><a href="#"><span class="glyphicon glyphicon-trash"></span></a></td>
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