<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Carrinho de compras</title>
</head>
<body>

<c:forEach items="${sessionCart.carrinho.itens}" var="elemento">
	${elemento.produto.nome}
	${elemento.produto.valor}
	${elemento.quantidade}
</c:forEach>
</body>
</html>