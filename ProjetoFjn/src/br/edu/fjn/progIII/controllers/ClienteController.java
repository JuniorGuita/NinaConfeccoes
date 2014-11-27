package br.edu.fjn.progIII.controllers;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.edu.fjn.progIII.dao.ClienteDAO;
import br.edu.fjn.progIII.dao.FornecedorDAO;
import br.edu.fjn.progIII.dao.ProdutoDAO;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Cliente.Cliente;
import br.edu.fjn.progIII.model.Estado.Estado;
import br.edu.fjn.progIII.model.Fornecedor.Fornecedor;

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
	public void salvar(Cliente cliente){
		ClienteDAO salvar = new ClienteDAO();
		salvar.salvaCliente(cliente);
		result.include("message", "Cliente "+cliente.getNome() + " incluido com sucesso!");
		result.redirectTo(this).form();
	}
	
	@Get("deletar/{id}")
	public void deletar(int id) {
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.deletarCliente(id);
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
	public void salvarAlteracoes(Cliente cliente){
		ClienteDAO clienteDAO = new ClienteDAO();
		clienteDAO.editar(cliente);
		result.redirectTo(this).editar(cliente.getId());
	}
}
