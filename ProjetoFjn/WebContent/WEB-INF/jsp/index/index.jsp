<jsp:include page="menu.jsp">
   <jsp:param value="Página Inicial" name="title"/>
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<section class="container">

   <legend>Últimos 3 produtos cadastrados</legend>
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
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${listarUltimosProdutos}" var="produto">
							<c:set var="incremento" value="${incremento + 1}"></c:set>
							<tr>
								<td>${incremento}</td>
								<td>${produto.codigo}</td>
								<td>${produto.marca}</td>
								<td>${produto.nome}</td>
								<td>R$${produto.valor}</td>
							</tr>

						</c:forEach>
					</tbody>
				</table>
			</div>

		</div>
</section>
<%@ include file="footer.jsp"%>