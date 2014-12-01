<jsp:include page="../index/menu.jsp">
	<jsp:param value="Identifique o cliente" name="title" />
</jsp:include>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
</head>
<body>

	<input type="text" id="nomeCliente">

	<script type="text/javascript">
		$(document).ready(function() {
			$("#nomeCliente").on("keyup", function() {
				if (($(this).val().length) >= 2) {
					var string = $(this).val();
					pesquisarCliente(string);
				}
			});
		});
		
		function pesquisarCliente(string) {
			$.getJSON('../cliente/buscaClienteJson/' + string, {},
					function(json) {
						exibeClientes(json);
					});
		}
		
		function exibeClientes(json){
			console.log(json);
		}
	</script>
</body>
</html>