package br.edu.fjn.progIII.controllers;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;
import br.edu.fjn.progIII.componentes.UserSession;
import br.edu.fjn.progIII.dao.ClienteDAO;
import br.edu.fjn.progIII.dao.FornecedorDAO;
import br.edu.fjn.progIII.dao.LogDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Estado.Estado;
import br.edu.fjn.progIII.model.Fornecedor.Fornecedor;
import br.edu.fjn.progIII.model.Log.Log;
import br.edu.fjn.progIII.model.Produto.Produto;

/*
 * 
 * @author Antonio Siqueira
 */

@Controller
@Path("cliente")
public class ClienteController {

	@Inject
	private Result result;

	@Inject
	private UserSession user;

	private Calendar calendar;

	@Get("novo")
	public void form() {
		EstadoController estadoController = new EstadoController();
		List<Estado> estados = estadoController.json();
		result.include("tituloFormulario", "Cadastrar Cliente");
		result.include("estados", estados);
	}

	@Get("list")
	public void listar() {
		ClienteDAO clienteDAO = new ClienteDAO();
		result.include("listarClientes", clienteDAO.listarClientes());
	}

	@Post
	public void salvar(Cliente cliente) {
		ClienteDAO salvar = new ClienteDAO();
		salvar.salvaCliente(cliente);

		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Salvou Cliente");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);

		result.include("message", "Cliente " + cliente.getNome()
				+ " incluido com sucesso!");
		result.redirectTo(this).form();
	}

	@Get("deletar/{id}")
	public void deletar(int id) {
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.deletarCliente(id);

		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Deletou Cliente");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);

		result.redirectTo(this).listar();
	}

	@Get("editar/{id}")
	public void editar(int id) {
		ClienteDAO clienteDAO = new ClienteDAO();
		Cliente cliente = clienteDAO.buscaPorId(id);
		EstadoController estadoController = new EstadoController();
		List<Estado> estados = estadoController.json();

		result.include("estados", estados);
		result.include("obj", cliente);
		result.include("tituloFormulario", "Editar Cliente");
	}

	@Post("salvar_alteracoes")
	public void salvarAlteracoes(Cliente cliente) {
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.editar(cliente);

		LogDAO logDAO = new LogDAO();
		Log log = new Log();
		log.setNome(user.getUsuario().getNome());
		log.setOperacao("Editou Cliente");
		log.setData(calendar.getInstance());
		logDAO.salvarLog(log);

		result.redirectTo(this).editar(cliente.getId());
	}

	@Get("busca/")
	public void busca(String string) {
		ClienteDAO clienteDAO = new ClienteDAO();
		List<Cliente> clientes = clienteDAO.busca(string);
		result.include("clientes", clientes);
		result.include("registros", clientes.size());
	}

	@Get("clientejson/{string}")
	public void buscaClienteJson(String string) {
		ClienteDAO clienteDAO = new ClienteDAO();
		List<Cliente> clientes = clienteDAO.busca(string);
		result.use(Results.json()).from(clientes, "clientes").recursive()
				.serialize();
	}

}
