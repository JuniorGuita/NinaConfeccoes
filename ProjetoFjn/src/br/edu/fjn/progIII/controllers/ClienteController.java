package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.ClienteDAO;
import br.edu.fjn.progIII.model.Cliente;

/*
 * 
 * @author Antonio Siqueira
 */

@Controller
@Path("cliente")
public class ClienteController {

	@Inject
	private Result result;
	
	@Get("novo")
	public void form(){
		
	}
	
	@Post
	public void salvar(Cliente cliente){
		ClienteDAO salvar = new ClienteDAO();
		salvar.salvaCliente(cliente);
		result.include("message", "Cliente "+cliente.getNome() + " incluído com sucesso!");
		result.redirectTo(this).form();
	}
}
