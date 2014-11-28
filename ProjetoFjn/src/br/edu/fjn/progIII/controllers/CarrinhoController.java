package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.CartSession;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.model.Carrinho.Carrinho;
import br.edu.fjn.progIII.model.Item.Item;
import br.edu.fjn.progIII.model.Produto.Produto;

@Controller
@Path("carrinho")
public class CarrinhoController {

	@Inject
	private Result result;

	@Inject
	private CartSession cartSession;

	@Get("adicionar/{id}")
	public void adicionar(int id) {
		if (id > 0) {
			System.out.println("[CarrinhoController] idProduto: " + id);
			ProdutoDAO produtoDAO = new ProdutoDAO();
			Produto produto = produtoDAO.buscaPorId(id);
			Item item = new Item();
			item.setProduto(produto);
			cartSession.addCarrinho(item);
		}

		result.redirectTo(this).form();
	}

	@Get("form")
	public void form() {

	}
}
