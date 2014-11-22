package br.edu.fjn.progIII.controllers;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.edu.fjn.progIII.dao.CidadeDAO;
import br.edu.fjn.progIII.model.Cidade.Cidade;

@Controller
@Path("cidade")
public class CidadeController {

	@Inject
	Result result;

	@Get({ "getjson", "getjson/" })
	public void getjson(String estadoId) {
		System.out.println("id da url: " + estadoId);
		CidadeDAO cidadeDAO = new CidadeDAO();
		List<Cidade> cidades = cidadeDAO.getList(estadoId);

		// NÃO FUNCIONA

		result.use(Results.json()).from(cidades, "cidades").recursive().serialize();
		// result.nothing();

		// FUNCIONA
		// String myJSON = criaJSON(cidades);
		// result.include("cidades", myJSON);
	}

	// Cria uma estrutura json
	public String criaJSON(List<Cidade> cidades) {
		ArrayList<String> json = new ArrayList<String>();
		for (Cidade cidade : cidades) {
			String s = "{\"id\":" + cidade.getId() + ", \"cidade\":" + "\""
					+ cidade.getCidade() + "\"}";
			json.add(s);
		}
		// return json.toString();
		return json.toString();
	}
}
