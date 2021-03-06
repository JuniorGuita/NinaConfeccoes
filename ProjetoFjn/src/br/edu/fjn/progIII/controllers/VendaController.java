package br.edu.fjn.progIII.controllers;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.componentes.CartSession;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.ClienteDAO;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.dao.VendaDAO;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Item.Item;
import br.edu.fjn.progIII.model.Log.Log;
import br.edu.fjn.progIII.model.Produto.Produto;
import br.edu.fjn.progIII.model.Venda.Venda;

@Controller
@Path("venda")
public class VendaController {

	@Inject
	private Result result;
	
	@Inject
	private UserSession user;
	
	@Inject
	private CartSession cartSession;
	
	private Calendar calendar;

	
	@Get("list")
	public void listar() {
		VendaDAO vendaDAO = new VendaDAO();
		result.include("listarVendas", vendaDAO.listarVendas());
	}
	
	
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
		
		Date data = new Date();
		SimpleDateFormat dataFormat = new SimpleDateFormat("dd/MM/yyyy");
		String dataFinal = dataFormat.format(data.getTime());	
		venda.setCalendar(dataFinal);
		
		
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Realizou Venda");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		vendaDAO.salvarVenda(venda);
		cartSession.setVenda(null);
		result.redirectTo(this).form();
	}
	
	@Get("deletar/{id}")
	public void deletar(int id) {
		VendaDAO vendaDao = new VendaDAO();
		vendaDao.deletarVenda(id);
		
		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Deletou Venda");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);
		
		result.redirectTo(this).listar();

	}
	

	@Get("detalhar/{id}")
	public void detalhar(int id) {
		VendaDAO vendaDAO = new VendaDAO();
		Venda venda = vendaDAO.buscaPorId(id);
		result.include("obj", venda);
		result.include("tituloFormulario", "Descriminar Venda");
		result.include("listarVendas", vendaDAO.listarVendas());
		
		List<Item> lista = venda.getItens();
		result.include("listar", lista);
	}
	
	@Get("busca/")
	public void busca(String string){
		VendaDAO vendaDAO = new VendaDAO();
		List<Venda> vendas = vendaDAO.busca(string);
		result.include("vendas", vendas);
		result.include("registros", vendas.size());
	}
	
}
