<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- Logradouro-->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Logradouro</label>
	<div class="col-md-4">
		<input id="textinput" name="${param.objetoName}.endereco.logradouro"
			value="${obj.endereco.logradouro}" placeholder="logradouro..."
			class="input-xlarge form-control" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Numero</label>
	<div class="col-md-4">
		<input id="textinput" name="${param.objetoName}.endereco.numero"
			value="${obj.endereco.numero}" placeholder="numero..."
			class="input-xlarge form-control" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Bairro</label>
	<div class="col-md-4">
		<input id="textinput" name="${param.objetoName}.endereco.bairro"
			value="${obj.endereco.bairro}" placeholder="bairro..."
			class="input-xlarge form-control" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Complemento</label>
	<div class="col-md-4">
		<input id="textinput" name="${param.objetoName}.endereco.complemento"
			value="${obj.endereco.complemento}" placeholder="complemento..."
			class="input-xlarge form-control" type="text">

	</div>
</div>

<!-- Text input-->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Estado</label>
	<div class="col-md-4">
		<select class="form-control" id="estado">
			<option value="0">..selecione..</option>

			<c:forEach var="uf" items="${estados}">
					<option value="${uf.id}">${uf.estado}</option>
			</c:forEach>
		</select>
	</div>
</div>
<!-- Select municipios -->
<div class="form-group">
	<label class="control-label col-md-2" for="textinput">Cidade</label>
	<div class="col-md-4">
		<select name="${param.objetoName}.endereco.cidade.id"
			class="form-control" id="municipios">
		</select>
	</div>
</div>

<script type="text/javascript">
	$(function() {
		$("#estado").on("change", function() {
			consultar($(this).val());
		});
	});

	function consultar(idEstado) {
		$.getJSON('<c:url value="/cidade/getjson/" />', {
			estadoId : idEstado
		}, function(json) {
			popularSelect("municipios", json);
		});
	}

	function popularSelect(element, json) {
		var options = "";
		$.each(json.cidades, function(chave, valor) {
			options += "<option value='" + valor.id + "'>" + valor.cidade
					+ "</option>";
		});
		$("#" + element).html(options);
	}
</script>