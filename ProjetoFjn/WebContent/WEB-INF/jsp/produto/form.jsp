<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%@include file="../includes/includeTopo.jsp" %>
	<div class="container">
		<form class="form-horizontal" action="${linkTo[ProdutoController].salvar()}" method="post">
			
			<!-- Form Name -->
			<legend>Cadastro de Produtos</legend>

			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Codigo: </label>
				<div class="col-md-10">
					<input id="textinput" name="produto.codigo" placeholder="codigo..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Marca: </label>
				<div class="col-md-10">
					<input id="textinput" name="produto.marca" placeholder="marca..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Nome: </label>
				<div class="col-md-10">
					<input id="textinput" name="produto.nome" placeholder="nome..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>
			
			<!-- Text input-->
			<div class="form-group">
				<label class="control-label col-md-2" for="textinput">Valor: </label>
				<div class="col-md-10">
					<input id="textinput" name="produto.valor" placeholder="R$99,99..."
						class="input-xlarge form-control" required="" type="text">

				</div>
			</div>
			
			<div class="row">
			<!-- Button -->
			<div class="control-group">
				<div class="col-md-12 text-right">
					<button id="singlebutton" name="singlebutton"
						class="btn btn-success btn-lg">Cadastrar</button>
						<p style="color: green;">${message}</p>
				</div>
			</div>
</div>
			
		</form>
	</div>
	
</body>
</html>