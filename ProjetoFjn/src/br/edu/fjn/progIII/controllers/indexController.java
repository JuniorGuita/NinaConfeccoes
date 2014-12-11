package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
/*
 * 
 * @author Antonio Siqueira
 */
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.dao.indexDAO;

@Controller
public class indexController {
	
	@Inject
	private Result result;
	
	@Get("/index")
	public void index(){
		indexDAO indexDAO = new indexDAO();
		result.include("listarUltimosProdutos", indexDAO.listarProdutos());
	}
	
	@Post
	public void form(){
		
	}	
}
