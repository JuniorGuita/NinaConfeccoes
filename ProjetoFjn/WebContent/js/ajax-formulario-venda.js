/**
 * 
 */
$(document).ready(function() {
	$("#nome_produto").on("keyup", function() {
		if (($(this).val().length) >= 2) {
			var string = $(this).val();
			pesquisarProduto(string);
		}
	});
});

function pesquisarProduto(string) {
	$.getJSON('../produto/pesquisar/' + string, {},
			function(json) {
				exibeProdutos(json);
			});
}

function exibeProdutos(json) {

	var options = "";
	$("#painel").empty();
	$.each(json.produtos, function(chave, valor) {
		options += '<form action="adicionar" method="post">';
		options += '<table class="table table-bordered table-condensed table-striped" id="painel">';
		options += "<tr>";
		options += '<td class="col-lg-1">' + valor.id + '</td>';
		options += "<td>" + valor.nome + "</td>";
		options += '<td class="col-lg-2 col-md-2">'
				+ valor.valor.toFixed(2) + '</td>';
		options += '<td class="col-lg-2 col-md-2">'
				+ valor.marca + '</td>';
		options += "<input type='hidden' name='produto.id' value='"
				+ valor.id + "'>";

		options += '<td class="col-lg-1 col-md-1">';
		options += '<input type="number" name="item.quantidade" tabindex="'
				+ (chave + 1) + '">';
		options += "</td>";

		options += '<td class="col-lg-1"><input type="submit" value="adicionar"></td>';

		options += "</tr>";
		options += "</table>";
		options += "</form>";
	});
	$("#panelProdutos").html(options);
}