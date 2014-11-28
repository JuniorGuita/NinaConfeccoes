<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table>
		<tr>
			<th>Item</th>
			<th>Quantidade</th>
			<th>Subtotal</th>
		</tr>
		
		<c:forEach items="${sessionCart.carrinho.itens}" var="elemento">
			<tr>
				<td>${elemento.produto.nome}</td>
				<td>${elemento.quantidade}</td>
				<td><a href="${linkTo[CarrinhoController].remover()}2">excluir</a></td>
				<td>${elemento.produto.valor}</td>
			</tr>
		</c:forEach>
	</table>
	</ul>
	<a href="${linkTo[CarrinhoController].adicionar()}2">Adicionar
		produto 2</a>
	<a href="${linkTo[CarrinhoController].adicionar()}3"> Adicionar
		produto 3</a>
</body>
</html>