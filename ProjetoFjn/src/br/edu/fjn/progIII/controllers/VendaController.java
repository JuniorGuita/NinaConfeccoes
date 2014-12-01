package br.edu.fjn.progIII.controllers;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.CartSession;
import br.edu.fjn.progIII.dao.ClienteDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.dao.VendaDAO;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Item.Item;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Venda.Venda;

@Controller
@Path("venda")
public class VendaController {

	@Inject
	private Result result;

	@Inject
	private CartSession cartSession;

	@Post("adicionar")
	public void adicionar(Produto produto, Item item) {
		System.out.println(produto.getId());
		System.out.println("Quantidade do Item: " + item.getQuantidade());

		if (item.getQuantidade() > 0) {
			ProdutoDAO produtoDAO = new ProdutoDAO();
			Produto p = produtoDAO.buscaPorId(produto.getId());
			Item i = new Item();
			i.setProduto(p);
			i.setQuantidade(item.getQuantidade());
			cartSession.addVenda(i);
		}

		result.redirectTo(this).form();
	}

	@Get("form")
	public void form() {

	}

	@Get("remover/{id}")
	public void remover(int id) {
		cartSession.removeItem(id);
		result.redirectTo(this).form();
		// cartSession.getCarrinho().();
	}
	
	@Get("identificacao")
	public void identificacaoCliente(){
		
	}
	
	@Get("definirCliente/{id}")
	public void definirCliente(int id){
		ClienteDAO clienteDAO = new ClienteDAO();
		Cliente cliente = clienteDAO.buscaPorId(id);
		cartSession.getVenda().setCliente(cliente);
	}
	
	@Get("salvar")
	public void salvarVenda(){
		Venda venda = cartSession.getVenda();
		VendaDAO vendaDAO = new VendaDAO();
		vendaDAO.salvarVenda(venda);
	}

}
