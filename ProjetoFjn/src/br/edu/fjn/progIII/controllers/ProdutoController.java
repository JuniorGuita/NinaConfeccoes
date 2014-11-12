package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.model.Produto;

@Controller
@Path("produto")
public class ProdutoController {
	
	@Inject
	private Result result;
	
	@Get("novo")
	public void form(){
		
	}
	
	@Post
	public void salvar(Produto produto){
		ProdutoDAO produtoDao = new ProdutoDAO();
		produtoDao.salvaProduto(produto);
		result.include("message", "Produto " + produto.getNome() + " salvo com sucesso!");
		result.redirectTo(this).form();
	}
}
