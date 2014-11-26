package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.CartSession;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.model.Carrinho.Carrinho;

@Controller
@Path("carrinho")
public class CarrinhoController {
	@Inject
	private Result result;

	@Inject
	private CartSession cartSession;
	
	@Get("adicionar")
	public void adicionar(){
	}
}
